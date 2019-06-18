package com.jeancoder.report.ready.report.service;

import java.util.regex.Matcher;
import java.util.regex.Pattern

import com.jeancoder.app.sdk.source.DatabaseSource
import com.jeancoder.app.sdk.source.LoggerSource
import com.jeancoder.core.log.JCLogger
import com.jeancoder.core.power.DatabasePower
import com.jeancoder.core.util.JackSonBeanMapper
import com.jeancoder.jdbc.JcPage;
import com.jeancoder.jdbc.JcTemplate;
import com.jeancoder.report.ready.report.dao.SysReportConditionDao;
import com.jeancoder.report.ready.report.dao.SysReportDesignDao;
import com.jeancoder.report.ready.report.dto.DrawDataReq
import com.jeancoder.report.ready.report.dto.ReportCondReq
import com.jeancoder.report.ready.report.dto.ReportDesignReq
import com.jeancoder.report.ready.report.dto.ReportFieldReq
import com.jeancoder.report.ready.report.dto.SelectItemRes
import com.jeancoder.report.ready.report.entity.SysReportCondition
import com.jeancoder.report.ready.report.entity.SysReportDesign;
import com.jeancoder.report.ready.report.entity.SysReportDesign.ReportField
import com.jeancoder.report.ready.util.MD5Util

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import net.sf.jsqlparser.expression.Expression;
import net.sf.jsqlparser.expression.Parenthesis;
import net.sf.jsqlparser.expression.operators.conditional.AndExpression;
import net.sf.jsqlparser.expression.operators.conditional.OrExpression;
import net.sf.jsqlparser.parser.CCJSqlParserManager;
import net.sf.jsqlparser.statement.Statement;
import net.sf.jsqlparser.statement.select.Join;
import net.sf.jsqlparser.statement.select.PlainSelect;
import net.sf.jsqlparser.statement.select.Select;
import net.sf.jsqlparser.statement.select.SelectExpressionItem;
import net.sf.jsqlparser.statement.select.SelectItem;
import net.sf.jsqlparser.statement.select.SelectVisitor;
import net.sf.jsqlparser.statement.select.SetOperationList;
import net.sf.jsqlparser.statement.select.WithItem;

public class SysReportDesignService {
	
	private static final JCLogger LOGGER = LoggerSource.getLogger();
	public static final SysReportDesignService INSTANCE = new SysReportDesignService();

	private SysReportDesignDao sysReportDesignDao = SysReportDesignDao.INSTANCE;
	
	private SysReportConditionDao sysReportConditionDao = SysReportConditionDao.INSTANCE;
	
	public JcPage<SysReportDesign> getDesignPage(Long projId,int pageSize,int pn){
		JcPage<SysReportDesign> page = new JcPage<SysReportDesign>();
		page.setPs(pageSize);
		page.setPn(pn);
		String hql = "select * from SysReportDesign a where 1=1 and proj_id = ? and flag <> ?";
		//page = sysReportDesignDao.findPage(page, hql,projId,-1);
		page = JcTemplate.INSTANCE().find(SysReportDesign, page, hql, projId, -1);
		return page;
	}
	
	public SysReportDesign getDesignById(def designId){
		String hql = "select * from SysReportDesign a where id=?";
		SysReportDesign design = JcTemplate.INSTANCE().get(SysReportDesign, hql, designId);
		if(design) {
			def sql = 'select * from SysReportCondition where design_id=? order by id asc';
			def cons = JcTemplate.INSTANCE().find(SysReportCondition, sql, designId);
			design.setConditions(cons);
		}
		return design;
		//return sysReportDesignDao.get(designId);
	}
	
	public SysReportDesign getDesignByNo(String designNo){
		return sysReportDesignDao.findByNo(designNo);
	}
	
	/**
	 * 执行普通厅sql语句
	 * @param sql
	 * @param syswherevalue
	 * @return
	 * @throws Exception
	 */
	public List<Map<String,Object>> executeSqlQuery(String sql,Map<String,Object> syswherevalue) throws Exception{
		List<Map<String,Object>> resset = new ArrayList<Map<String,Object>>();
		
		MySelect myselect = full_analysis_sql(sql);
		StringBuffer itemstr = new StringBuffer();
		List<String> names = new ArrayList<String>();
		for(String key : myselect.getItems().keySet()){
			if(itemstr.length() > 0){
				itemstr.append(",");
			}
			itemstr.append(key);
			names.add(key);
		}
		
		String wherestr = geneWhereStr(myselect.getWheres(), new HashMap<String,String>(), syswherevalue);
		
		String runsql = "SELECT "+itemstr+" FROM "+myselect.getFroms();
		
		runsql += wherestr;
		
		//Query query = sysReportDesignDao.getSession().createSQLQuery(runsql);
		//@SuppressWarnings("unchecked")
		//List<Object[]> sqlres = query.list();
		List<Object[]> sqlres = JcTemplate.INSTANCE().findRawData(null, runsql);
		for(Object[] objs : sqlres){
			int i = 0;
			Map<String,Object> row = new HashMap<String,Object>();
			for(Object obj : objs){
				row.put(names.get(i++), obj);
			}
			resset.add(row);
		}

		return resset;
	}
	
	/**
	 * 执行已存在报表的sql
	 * @param report_no
	 * @param postdata
	 * @param syswherevalue
	 * @return
	 */
	public MyPage<Object> executeSqlQuery(String report_no, DrawDataReq postdata, Map<String,Object> syswherevalue){
		MyPage<Object> resbody = new MyPage<Object>();
		resbody.setPs(postdata.getPageSize());
		resbody.setPn(postdata.getPageNo());
		resbody.setSortBy(postdata.getSortBy());
		
		SysReportDesign design = sysReportDesignDao.findByNo(report_no);
		
		List<Object> titleRow = new ArrayList<Object>();
		
		String dimstr = concatMatchDimMea(design.getReportDimensionObj(),postdata.getDimensions(),titleRow);
		String meastr = concatMatchDimMea(design.getReportMeasureObj(),postdata.getMeasure(),titleRow);
		
		String groupstr = geneGroupStr(design.getReportDimensionObj(),postdata.getDimensions());
		String wherestr = geneWhereStr(design.getReportWhereObj(),postdata.getWheres(),syswherevalue);
		
		LOGGER.info('wherestr=' + wherestr);
		String orderstr = geneSortStr(design.getReportFieldObj(),postdata.getSortBy());
		
		String fullsql = "SELECT "+dimstr;
		
		if(postdata.getMeasure() != null && !postdata.getMeasure().isEmpty()){
			//如果不设置度量 不拼度量
			fullsql += ","+meastr;
		}
		
		fullsql += " FROM "+design.getReport_from()+" "+wherestr;
		
		fullsql += " GROUP BY "+groupstr;
		
		String tcountSql = "SELECT COUNT(1) FROM ("+fullsql+") a";
//		Query tcountQuery = sysReportDesignDao.getSession().createSQLQuery(tcountSql);
//		Integer tcount = Integer.valueOf(String.valueOf(tcountQuery.uniqueResult()));
		def tcountList = JcTemplate.INSTANCE().findRawData(String.class, tcountSql)
		Long tcount = 0;
		if (tcountList != null && !tcountList.isEmpty()) {
			def tcounts = tcountList.get(0);
			tcounts = tcounts[0];
			tcount = Long.parseLong(tcounts.toString()) ;
		}
		if(tcount > postdata.getPageSize()){
			//如果返回条数大于不分页最大条数 执行分页
			resbody.setByPage(true);
			resbody.setTotalCount(tcount);
		}
		
		titleRow.add(0,"序号");
		resbody.setTitleRow(titleRow.toArray());
		
		//最后拼上排序子句
		fullsql += orderstr;
		
		//System.out.println(fullsql);
		
//		Query query = sysReportDesignDao.getSession().createSQLQuery(fullsql);
//		if(resbody.isByPage){
//			//如果分页了
//			query.setMaxResults(resbody.getPageSize());
//			query.setFirstResult((postdata.getPageNo() - 1) * postdata.getPageSize());
//		}
//		List<Object[]> sqlres = query.list();
		JcPage<Object[]> page = new JcPage<Object[]>();
		page.setPn(postdata.getPageNo());
		page.setPs(resbody.getPs());
		
		LOGGER.info('full_sql======' + fullsql);
		JcPage<Object[]> sqlres = JcTemplate.INSTANCE().findRawData(null, page, fullsql);
		
		if(sqlres != null && sqlres.result!=null && !sqlres.result.isEmpty()){
			if(postdata.getMeasure() != null && !postdata.getMeasure().isEmpty() 
					&& meastr.toUpperCase().indexOf("GROUP_CONCAT") == -1){
				//如果不设置度量 或者维度中有非计算类型的计算表达式  不需要统计行
				String totalsql = "SELECT COUNT(1),"+meastr+" FROM "+design.getReport_from()+" "+wherestr;
				List<Object[]> totalres = JcTemplate.INSTANCE().findRawData(null, totalsql);
				
				List<Object> totalRow = new ArrayList<Object>();
				int ic=postdata.getDimensions().size();
				for(int i = 0;i<ic;i++){
					totalRow.add("-");
				}
				int i=0;
				for(Object o : totalres.get(0)){
					if(i >= 1){
						totalRow.add(o.toString());
					}
					i++;
				}
				totalRow.add(0,"合计");
				resbody.setTotalRow(totalRow.toArray());
			}
		}
		
		//复制数据 添加第一列为序列
		List<Object[]> resdata = new ArrayList<Object[]>();
		if(sqlres != null && sqlres.result!=null && !sqlres.result.isEmpty()){
			int ic = sqlres.result.size();
			for(int i=1;i<=ic;i++){
				Object[] oldrow = sqlres.result.get(i-1);
				oldrow = toStringObj(oldrow);
				Object[] newrow = new Object[oldrow.length+1];
				newrow[0] = ((postdata.getPageNo() - 1) * postdata.getPageSize()) + i;
				System.arraycopy(oldrow, 0, newrow, 1, oldrow.length);
				resdata.add(newrow);
			}
		}
		
		resbody.setResult(resdata);
		
		return resbody;
	}
	
	/**
	 * 将查询的数据写入到 输入流中
	 * @param report_no
	 * @param postdata
	 * @param syswherevalue
	 * @param os
	 * @throws Exception 
	 */
	public InputStream executeSqlQuery4Excel(String report_no,DrawDataReq postdata,Map<String,Object> syswherevalue) throws Exception{
		ByteArrayOutputStream os = new ByteArrayOutputStream();
		WritableWorkbook workBook = Workbook.createWorkbook(os);
		WritableSheet sheet = workBook.createSheet("Sheet1", 0);
		int xlsrow = 0;
		int xlscol = 0;
		
		SysReportDesign design = sysReportDesignDao.findByNo(report_no);
		
		List<Object> titleRow = new ArrayList<Object>();
		
		String dimstr = concatMatchDimMea(design.getReportDimensionObj(),postdata.getDimensions(),titleRow);
		String meastr = concatMatchDimMea(design.getReportMeasureObj(),postdata.getMeasure(),titleRow);
		
		String groupstr = geneGroupStr(design.getReportDimensionObj(),postdata.getDimensions());
		String wherestr = geneWhereStr(design.getReportWhereObj(),postdata.getWheres(),syswherevalue);
		
		String orderstr = geneSortStr(design.getReportFieldObj(),postdata.getSortBy());
		
		String fullsql = "SELECT "+dimstr;
		
		if(postdata.getMeasure() != null && !postdata.getMeasure().isEmpty()){
			//如果不设置度量 不拼度量
			fullsql += ","+meastr;
		}
		
		fullsql += " FROM "+design.getReport_from()+" "+wherestr;
		
		fullsql += " GROUP BY "+groupstr;
		
		//WRITE 写头部 
		titleRow.add(0,"序号");
		xlscol = 0;
		for(Object o : titleRow){
			Label label = new Label(xlscol++,xlsrow,String.valueOf(o));
			sheet.addCell(label);
		}
		xlsrow ++;
		
		//最后拼上排序子句
		fullsql += orderstr;
		
		//WRITE 写数据体
		boolean hasdata = false;
		
		List<Object[]> datas = JcTemplate.INSTANCE().findRawData(null, fullsql);
		Iterator<Object[]> res = datas.iterator();
		int rownum = 0;
		while(res.hasNext()){
			hasdata = true;
			
			xlscol = 0;
			Object[] row_datas = res.next();
			Label rowlabel = new Label(xlscol++,xlsrow,String.valueOf(++rownum));
			sheet.addCell(rowlabel);
			int ic = row_datas.length;
			for(int i=0;i<ic;i++){
				Label label = new Label(xlscol++,xlsrow,String.valueOf(row_datas[i]));
				sheet.addCell(label);
			}
			xlsrow ++;
		}
		
		if(hasdata){
			if(postdata.getMeasure() != null && !postdata.getMeasure().isEmpty() 
					&& meastr.toUpperCase().indexOf("GROUP_CONCAT") == -1){
				//如果不设置度量 或者维度中有非计算类型的计算表达式  不需要统计行
				String totalsql = "SELECT COUNT(1),"+meastr+" FROM "+design.getReport_from()+" "+wherestr;
				List<Object[]> totalres = JcTemplate.INSTANCE().findRawData(null, totalsql);
				List<Object> totalRow = new ArrayList<Object>();
				int ic=postdata.getDimensions().size();
				for(int i=0;i<ic;i++){
					totalRow.add("-");
				}
				int i=0;
				for(Object o : totalres.get(0)){
					if(i >= 1){
						totalRow.add(o.toString());
					}
					i++;
				}
				
				//WRITE 写尾部 
				totalRow.add(0,"合计");
				xlscol = 0;
				for(Object o : totalRow){
					Label label = new Label(xlscol++,xlsrow,String.valueOf(o.toString()));
					sheet.addCell(label);
				}
				xlsrow ++;
			}
		}
		
		workBook.write();
		workBook.close();
		os.flush();
		os.close();
		ByteArrayInputStream swapStream = new ByteArrayInputStream(os.toByteArray());
		return (InputStream)swapStream;
	}
	
	/**
	 * 使用与维度 度量的拼接
	 * @param fields
	 * @param keys
	 * @param titleRow
	 * @return
	 */
	public String concatMatchDimMea(List<ReportField> fields,List<String> keys,List<Object> titleRow){
		StringBuffer sb = new StringBuffer();
		for(ReportField field : fields){
			if(keys.contains(field.getKey())){
				if(sb.length() > 0){
					sb.append(",");
				}
				if(field.getAlias() != null && !"".equals(field.getAlias())){
					sb.append(field.getExpression()+" AS "+field.getAlias());
				}else{
					sb.append(field.getExpression());
				}
				titleRow.add(field.getView_name());
			}
		}
		return sb.toString();
	}
	
	/**
	 * 生成group by子句内容 不包含group by
	 * @param fields
	 * @param keys
	 * @return
	 */
	public String geneGroupStr(List<ReportField> fields,List<String> keys){
		StringBuffer sb = new StringBuffer();
		for(ReportField field : fields){
			if(keys.contains(field.getKey())){
				if(sb.length() > 0){
					sb.append(",");
				}
				if(field.getAlias() != null){
					sb.append(field.getAlias());
				}else{
					sb.append(field.getExpression());
				}
			}
		}
		return sb.toString();
	}
	
	/**
	 * 生成where 子句 包含where
	 * @param wheres
	 * @param reqwherevalue
	 * @param syswherevalue
	 * @return
	 */
	public String geneWhereStr(List<String> wheres,Map<String,String> reqwherevalue,Map<String,Object> syswherevalue){
		Pattern p = Pattern.compile('\" *\\$\\{[^\"}]*\\} *\"');
		Pattern vp = Pattern.compile('\\$\\{(.*)\\}');
		
		StringBuffer sb = new StringBuffer();
		for(String s : wheres){
			Matcher mat = p.matcher(s);
			while(mat.find()){
				String org_exp = mat.group();
				Matcher vmat = vp.matcher(org_exp);
				if(vmat.find() && vmat.groupCount() == 1){
					//需要执行替换了
					String key = vmat.group(1).trim();
					if(syswherevalue.containsKey(key)){
						s = s.replace(org_exp, String.valueOf(syswherevalue.get(key)));
						continue;
					}
					if(reqwherevalue.containsKey(key)){
						if(reqwherevalue.get(key) != null && !"".equals(reqwherevalue.get(key))){
							s = s.replace(org_exp, reqwherevalue.get(key));
							continue;
						}else{
							s = "1 = 1";
							continue;
						}
					}
					s = "1 = 1";
				}
			}
			sb.append(" "+s+" ");
		}
		return sb.toString();
	}
	
	/**
	 * 生成排序子句  包含sort关键字
	 * @param fields
	 * @param reqSortStr
	 * @return
	 */
	public String geneSortStr(List<ReportField> fields,String reqSortStr){
		if(reqSortStr == null || "".equals(reqSortStr)){
			return "";
		}
		if(!reqSortStr.endsWith(" asc") && !reqSortStr.endsWith(" desc")){
			return "";
		}
		String key = reqSortStr.substring(0, reqSortStr.lastIndexOf(" "));
		for(ReportField field : fields){
			if(field.getView_name().equals(key)){
				return " ORDER BY "+field.getExpression()+reqSortStr.substring(reqSortStr.lastIndexOf(" "));
			}
		}
		return "";
	}
	
	/**
	 * 简单分析一下查询项
	 * @param sql
	 * @return
	 * @throws Exception
	 */
	public List<SelectItemRes> analysis_sql(String sql) throws Exception{
		List<SelectItemRes> resitems = new ArrayList<SelectItemRes>();
		
		CCJSqlParserManager pm = new CCJSqlParserManager();
		Statement sta = pm.parse(new StringReader(sql));
		Select selsta = null;
		if(sta instanceof Select){
			selsta = (Select)sta;
		}
		selsta.getSelectBody().accept(new SelectVisitor() {
			@Override
			public void visit(WithItem withItem) {
			}
			@Override
			public void visit(SetOperationList setOpList) {
			}
			@Override
			public void visit(PlainSelect plainSelect) {
				List<SelectItem> items = plainSelect.getSelectItems();
				for(SelectItem item : items){
					SelectExpressionItem exp = (SelectExpressionItem)item;
					SelectItemRes resitem = new SelectItemRes();
					resitem.setExpression(exp.getExpression().toString());
					if(exp.getAlias() != null){
						resitem.setAlias(exp.getAlias().getName());
					}
					resitems.add(resitem);
				}
			}
		});
		return resitems;
	}
	
	/**
	 * 完整的分析一下sql
	 * @param sql
	 * @return
	 * @throws Exception
	 */
	public MySelect full_analysis_sql(String sql) throws Exception{
		try{
			MySelect myselect = new MySelect();
			
			myselect.setSql(sql);
			
			CCJSqlParserManager pm = new CCJSqlParserManager();
			Statement sta = pm.parse(new StringReader(sql));
			Select selsta = null;
			if(sta instanceof Select){
				selsta = (Select)sta;
			}
			selsta.getSelectBody().accept(new SelectVisitor() {
				@Override
				public void visit(WithItem withItem) {
				}
				@Override
				public void visit(SetOperationList setOpList) {
				}
				@Override
				public void visit(PlainSelect plainSelect) {
					//查询的字段
					List<SelectItem> items = plainSelect.getSelectItems();
					for(SelectItem item : items){
						SelectExpressionItem exp = (SelectExpressionItem)item;
						MySelectItem selitem = new MySelectItem();
						selitem.setMd5key(MD5Util.getMD5(exp.getExpression().toString()));
						selitem.setExpression(exp.getExpression().toString());
						if(exp.getAlias() != null){
							selitem.setAlias(exp.getAlias().getName());
						}
						myselect.getItems().put(exp.getExpression().toString(), selitem);
					}
					
					//查询的表
					StringBuffer froms = new StringBuffer();
					froms.append(plainSelect.getFromItem().toString());
					
					List<Join> joins = plainSelect.getJoins();
					if(joins != null){
						for(Join join : joins){
							if(join.isSimple()){
								froms.append(","+join);
							}else{
								froms.append(" "+join);
							}
						}
					}
					myselect.setFroms(froms.toString());
					
					//查询的条件
					Stack<String> wheres = new Stack<String>();
					analysis_where(plainSelect.getWhere(),wheres);
					if(wheres.size() > 0){
						wheres.push("WHERE");
					}
					while(wheres.size() > 0){
						myselect.getWheres().add(wheres.pop());
					}
				}
			});
			
			return myselect;
		}catch(Exception e){
			throw new Exception("Sql parse error."+e.getCause().toString());
		}
	}
	
	public void analysis_where(Expression whereexp,Stack<String> fillResult){
		if(whereexp == null || fillResult == null){
			return;
		}
		if(whereexp instanceof AndExpression){
			//逻辑与
			AndExpression and = (AndExpression)whereexp;
			analysis_where(and.getRightExpression(),fillResult);
			fillResult.push("AND");
			analysis_where(and.getLeftExpression(),fillResult);
		}else if(whereexp instanceof OrExpression){
			//逻辑或
			OrExpression or = (OrExpression)whereexp;
			analysis_where(or.getRightExpression(),fillResult);
			fillResult.push("OR");
			analysis_where(or.getLeftExpression(),fillResult);
		}else if(whereexp instanceof Parenthesis){
			//逻辑括号
			Parenthesis sis = (Parenthesis)whereexp;
			fillResult.push(")");
			analysis_where(sis.getExpression(),fillResult);
			fillResult.push("(");
		}else{
			//判断条件表达式
			fillResult.push(" "+whereexp.toString()+" ");
		}
	}
	
	public void saveReport(ReportDesignReq design,Long projId,Long userId)throws Exception{
		if(design.getId() != null){
			updateReport(design,projId,userId);
		}else{
			addReport(design,projId,userId);
		}
	}
	
	public void addReport(ReportDesignReq design,Long projId,Long userId)throws Exception{
		SysReportDesign nodesign = sysReportDesignDao.findByNo(design.getReport_no());
		if(nodesign != null){
			throw new Exception("The report no is exists.");
		}
		
		MySelect myselect = full_analysis_sql(design.getSql());
		SysReportDesign designEntity = new SysReportDesign();
		fillReportEntity(design, projId, userId, designEntity, myselect);
		
		//sysReportDesignDao.save(designEntity);
		designEntity.id = JcTemplate.INSTANCE().save(designEntity);
		
//		String delhql = "DELETE FROM SysReportCondition WHERE design.id = ?";
//		sysReportConditionDao.createQuery(delhql, designEntity.getId()).executeUpdate();
		
		String delhql = "DELETE FROM SysReportCondition WHERE design_id = ?";
		JcTemplate.INSTANCE().batchExecute(delhql, designEntity.getId());
		
		if(design.getConds() != null){
			for(ReportCondReq reqcond : design.getConds()){
				if("JSON".equalsIgnoreCase(reqcond.getExpression_type())){
					SysReportCondition condEntity = new SysReportCondition();
					SysReportCondition.CondExpression condExpression = new SysReportCondition.CondExpression();
					condExpression.setOrgExpression(reqcond.getExpression());
					condEntity.setCond_expression(JackSonBeanMapper.toJson(condExpression));
					condEntity.setCond_expression_type(reqcond.getExpression_type());
					condEntity.setCond_keyword(reqcond.getKeyword());
					condEntity.setCond_name(reqcond.getCondname());
					condEntity.setCond_type(reqcond.getType());
					condEntity.setCond_where_value(reqcond.getKey());
					condEntity.setCond_view_value(reqcond.getValue());
					condEntity.setDesign_id(designEntity.id);
					//condEntity.setDesign(designEntity);
					
					//sysReportConditionDao.save(condEntity);
					JcTemplate.INSTANCE().save(condEntity);
				}else if("SQL".equalsIgnoreCase(reqcond.getExpression_type())){
					
					SysReportCondition condEntity = new SysReportCondition();
					SysReportCondition.CondExpression condExpression = new SysReportCondition.CondExpression();
					
					if("Select".equalsIgnoreCase(reqcond.getType()) || "MultipleSelect".equalsIgnoreCase(reqcond.getType())
							|| "SSelect".equalsIgnoreCase(reqcond.getType()) || "SMultipleSelect".equalsIgnoreCase(reqcond.getType())){
						MySelect mycond = full_analysis_sql(reqcond.getExpression());
						condExpression.setOrgExpression(mycond.getSql());
						condExpression.setWhere(mycond.getWheres());
					}
					
					condEntity.setCond_expression(JackSonBeanMapper.toJson(condExpression));
					condEntity.setCond_expression_type(reqcond.getExpression_type());
					condEntity.setCond_keyword(reqcond.getKeyword());
					condEntity.setCond_name(reqcond.getCondname());
					condEntity.setCond_type(reqcond.getType());
					condEntity.setCond_where_value(reqcond.getKey());
					condEntity.setCond_view_value(reqcond.getValue());
					condEntity.setDesign_id(designEntity.id);
					//condEntity.setDesign(designEntity);
					
					//sysReportConditionDao.save(condEntity);
					JcTemplate.INSTANCE().save(condEntity);
				}
			}
		}
	}
	
	public void updateReport(ReportDesignReq design,Long projId,Long userId)throws Exception{
		//SysReportDesign designEntity = sysReportDesignDao.get(design.getId());
		SysReportDesign designEntity = JcTemplate.INSTANCE().get(SysReportDesign, 'select * from SysReportDesign where id=?', design.id);
		if(designEntity == null){
			throw new Exception("Update report is not exists.");
		}
		
		MySelect myselect = full_analysis_sql(design.getSql());
		fillReportEntity(design, projId, userId, designEntity, myselect);
		
		//sysReportDesignDao.save(designEntity);
		//JcTemplate.INSTANCE().update(designEntity);
		DatabasePower dbpower = DatabaseSource.getDatabasePower();
		dbpower.doUpdateSerialize(designEntity, "id");
		
		String delhql = "DELETE FROM SysReportCondition WHERE design_id = ?";
		//sysReportConditionDao.createQuery(delhql, designEntity.getId()).executeUpdate();
		JcTemplate.INSTANCE().batchExecute(delhql, designEntity.id);
		
		if(design.getConds() != null){
			for(ReportCondReq reqcond : design.getConds()){
				if("JSON".equalsIgnoreCase(reqcond.getExpression_type())){
					SysReportCondition condEntity = new SysReportCondition();
					SysReportCondition.CondExpression condExpression = new SysReportCondition.CondExpression();
					condExpression.setOrgExpression(reqcond.getExpression());
					
					condEntity.setCond_expression(JackSonBeanMapper.toJson(condExpression))
					condEntity.setCond_expression_type(reqcond.getExpression_type());
					condEntity.setCond_keyword(reqcond.getKeyword());
					condEntity.setCond_name(reqcond.getCondname());
					condEntity.setCond_type(reqcond.getType());
					condEntity.setCond_where_value(reqcond.getKey());
					condEntity.setCond_view_value(reqcond.getValue());
					condEntity.setDesign_id(designEntity.id);
					//condEntity.setDesign(designEntity);
					
					//sysReportConditionDao.save(condEntity);
					JcTemplate.INSTANCE().save(condEntity);
				}else if("SQL".equalsIgnoreCase(reqcond.getExpression_type())){
					
					SysReportCondition condEntity = new SysReportCondition();
					SysReportCondition.CondExpression condExpression = new SysReportCondition.CondExpression();
					
					if("Select".equalsIgnoreCase(reqcond.getType()) || "MultipleSelect".equalsIgnoreCase(reqcond.getType())
							|| "SSelect".equalsIgnoreCase(reqcond.getType()) || "SMultipleSelect".equalsIgnoreCase(reqcond.getType())){
						MySelect mycond = full_analysis_sql(reqcond.getExpression());
						condExpression.setOrgExpression(mycond.getSql());
						condExpression.setWhere(mycond.getWheres());
					}
					
					condEntity.setCond_expression(JackSonBeanMapper.toJson(condExpression));
					condEntity.setCond_expression_type(reqcond.getExpression_type());
					condEntity.setCond_keyword(reqcond.getKeyword());
					condEntity.setCond_name(reqcond.getCondname());
					condEntity.setCond_type(reqcond.getType());
					condEntity.setCond_where_value(reqcond.getKey());
					condEntity.setCond_view_value(reqcond.getValue());
					condEntity.setDesign_id(designEntity.id);
					//condEntity.setDesign(designEntity);
					
					//sysReportConditionDao.save(condEntity);
					JcTemplate.INSTANCE().save(condEntity);
				}
			}
		}
	}
	
	/**
	 * 填充属性
	 * @param design
	 * @param projId
	 * @param userId
	 * @param designEntity
	 * @param myselect
	 */
	public void fillReportEntity(ReportDesignReq design,Long projId,Long userId,SysReportDesign designEntity,MySelect myselect){
		designEntity.setReport_sql(myselect.getSql());
		designEntity.setProj_id(projId);
		designEntity.setUser_id(userId);
		designEntity.setReport_name(design.getReport_name());
		designEntity.setReport_no(design.getReport_no());
		
		designEntity.setReport_where(JackSonBeanMapper.toJson(myselect.getWheres()));
		
		//解决 系统bug  多张表需要用空格 
		def fromBuffer = new StringBuffer();
		for (String from : myselect.getFroms().split(",")) {
			fromBuffer.append(from + ", ");
		}
		fromBuffer = fromBuffer.substring(0, fromBuffer.length()-2);
		designEntity.setReport_from(fromBuffer.toString());
		
		
		
		List<SysReportDesign.ReportField> dimensions = new ArrayList<SysReportDesign.ReportField>();
		List<SysReportDesign.ReportField> measures = new ArrayList<SysReportDesign.ReportField>();
		List<SysReportDesign.ReportField> repitems = new ArrayList<SysReportDesign.ReportField>();
		for(ReportFieldReq reqfield : design.getFields()){
			String key = reqfield.getExpression();
			if(myselect.getItems().containsKey(key)){
				MySelectItem selfield = myselect.getItems().get(reqfield.getExpression());
				SysReportDesign.ReportField repfield = new SysReportDesign.ReportField();
				repfield.setKey(selfield.getMd5key());
				repfield.setView_name(reqfield.getView_name());
				repfield.setExpression(reqfield.getExpression());
				repfield.setAlias(selfield.getAlias());
				
				repitems.add(repfield);
				
				if(design.getDimensions() != null){
					for(String dimstr : design.getDimensions()){
						if(repfield.getExpression().equals(dimstr)){
							dimensions.add(repfield);
							break;
						}
					}
				}
				if(design.getMeasures() != null){
					for(String meastr : design.getMeasures()){
						if(repfield.getExpression().equals(meastr)){
							measures.add(repfield);
							break;
						}
					}
				}
			}
		}
		designEntity.setReport_field(JackSonBeanMapper.toJson(repitems));
		designEntity.setReport_dimension(JackSonBeanMapper.toJson(dimensions));
		designEntity.setReport_measure(JackSonBeanMapper.toJson(measures));
	}
	
	public class MySelect{
		private String sql;
		private Map<String,MySelectItem> items = new HashMap<String,MySelectItem>();
		private List<String> wheres = new ArrayList<String>();
		private String froms;
		
		public String getSql() {
			return sql;
		}
		public void setSql(String sql) {
			this.sql = sql;
		}
		public Map<String, MySelectItem> getItems() {
			return items;
		}
		public void setItems(Map<String, MySelectItem> items) {
			this.items = items;
		}
		public List<String> getWheres() {
			return wheres;
		}
		public void setWheres(List<String> wheres) {
			this.wheres = wheres;
		}
		public String getFroms() {
			return froms;
		}
		public void setFroms(String froms) {
			this.froms = froms;
		}
	}
	public class MySelectItem{
		private String md5key;
		private String expression;
		private String alias;
		
		public String getMd5key() {
			return md5key;
		}
		public void setMd5key(String md5key) {
			this.md5key = md5key;
		}
		public String getExpression() {
			return expression;
		}
		public void setExpression(String expression) {
			this.expression = expression;
		}
		public String getAlias() {
			return alias;
		}
		public void setAlias(String alias) {
			this.alias = alias;
		}
	}
	
	public class MyPage<T> extends JcPage<T>{
		private boolean isByPage = false;
		private String sortBy = "";
		private Object[] totalRow;
		private Object[] titleRow;
		public boolean isByPage() {
			return isByPage;
		}
		public void setByPage(boolean isByPage) {
			this.isByPage = isByPage;
		}
		public String getSortBy() {
			return sortBy;
		}
		public void setSortBy(String sortBy) {
			this.sortBy = sortBy;
		}
		public Object[] getTotalRow() {
			return totalRow;
		}
		public void setTotalRow(Object[] totalRow) {
			this.totalRow = totalRow;
		}
		public Object[] getTitleRow() {
			return titleRow;
		}
		public void setTitleRow(Object[] titleRow) {
			this.titleRow = titleRow;
		}
	}
	
	private Object[] toStringObj(Object[] o) {
		Object[] newrow = new Object[o.length];
		for (int i =0; i < o.length; i++) {
			newrow[i] = o[i].toString()
		}
		return newrow;
		
	}
}
