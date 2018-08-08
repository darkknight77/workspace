package off;

import java.util.HashMap;
import java.util.List;

public class Test {
	
	public void boxMapping(List<TNBox> TNboxesforExpiry,int due,Long id)
	{
		List<TNBox> findTNboxesforexpiry=TNboxesforExpiry;
		HashMap<school,List<TNBox>> map=new HashMap<school, List<TNBox>>();
		HashMap<SalesPerson,HashMap<school,List<TNBox>>> spmap= new HashMap<SalesPerson,HashMap<school,List<TNBox>>>();
		if(findTNboxesforexpiry != null && findTNboxesforexpiry.size() >0)
		{
			for(TNBox tnb:findTNboxesforexpiry)
			{
				school sch=tnb.getCurrentLoc().getSnPurchaseOrder().getSchool();
			}
		}
	
	}
	

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
		
		
		
	}

}
