package webservice;

import com.thomas_bayer.blz.BLZService;
import com.thomas_bayer.blz.BLZServicePortType;
import com.thomas_bayer.blz.DetailsType;

public class ipcountryfinder {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
      String blzcode="38070059";
		BLZService blz=new BLZService();
	BLZServicePortType blzporttype=	blz.getBLZServiceSOAP11PortHttp();
		DetailsType dlt=blzporttype.getBank(blzcode);
		
		System.out.println(dlt.getBezeichnung());
	}

}
