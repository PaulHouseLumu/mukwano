package sales.model;

import java.util.Comparator;

import sales.dao.SalesDao;


public class SalesComparator implements Comparator<SalesDao>{
	
	public SalesComparator(){}
	        @Override
	        public int compare(SalesDao productLine1, SalesDao productLine2) 
	        {
	        
	        if(productLine1.productLineSales == productLine2.productLineSales)  
	            return 0;  
	        else if(productLine1.productLineSales>productLine2.productLineSales)  
	            return 1;  
	        else
	        	return -1;
	        }

	        
	        
}