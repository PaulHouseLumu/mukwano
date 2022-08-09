package sales.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.TreeMap;



import sales.model.SalesComparator;

import DBUtils.DBUtil;

public class SalesDao {
	public int result = 0, productLineSales, productLineId;
	
	public SalesDao(int productLineId, int productLineSales){
		this.productLineId = productLineId;
		this.productLineSales = productLineSales;
	}
	TreeMap<SalesDao, Integer> tMap = new TreeMap<SalesDao, Integer>(new SalesComparator());
	ResultSet rs;
	
	public int getSales() throws ClassNotFoundException{
		//where month(order_date)=month(now())-1;
		String GET_SALES_SQL = "SELECT `productLine_id`, `productLineSales` FROM sales "
				+ "WHERE  month(timeStamp) = month(now())";
		 try(
				 Connection connection = new DBUtil().getConnection();
				 // Step2: Create a statement using connection object
				 PreparedStatement preparedStatement = connection.prepareStatement(GET_SALES_SQL)){
			 
			 // Step3: Execute the query
			 rs  = preparedStatement.executeQuery();
			 while (rs.next()) {               			// Position the cursor                  
				 productLineId = rs.getInt(1);        	// Retrieve the second column value
				 productLineSales = rs.getInt(2);  		// Retrieve the third column value
				 SalesDao salesDao = new SalesDao(productLineId, productLineSales);
//				 System.out.println("ProductLineId = " + salesDao.productLineId +
//				   "NumberOfSales = " + salesDao.productLineSales);	// Print the column values
				// tMap.put(new Student(1, "John", 19), "From USA");
				 tMap.put(new SalesDao(productLineId, productLineSales), null);
				}
			 for(SalesDao salesDao : tMap.keySet())
		       {
		           System.out.println("ProductLine ID: "+salesDao.productLineId +" | "
		       +"ProductLine Sales: "+salesDao.productLineSales); 
		       }
			 rs.close();                       	// Close the ResultSet 
			 preparedStatement.close();       	// Close the PreparedStatement   
		 } catch(SQLException e) {
			 e.printStackTrace();
		 }
		 return result;
	 }
	}
 

