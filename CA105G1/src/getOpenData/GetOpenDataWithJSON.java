package getOpenData;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class GetOpenDataWithJSON {
	private static String MY_URL = "https://iplay.sa.gov.tw/api/GymSearchAllList?$format=application/json;odata.metadata=none&City=桃園市&GymType=籃球場";
	
	public static void main(String[] args) throws IOException, JSONException {
		URL url = new URL(MY_URL);
		HttpURLConnection con = (HttpURLConnection)url.openConnection();
		con.setRequestMethod("GET");
		con.setUseCaches(false);
		con.setConnectTimeout(5000);
		
		InputStream is = con.getInputStream();
		InputStreamReader isr = new InputStreamReader(is);
		BufferedReader br = new BufferedReader(isr);
		
		StringBuilder sb = new StringBuilder();
		
		String str;
		while ((str = br.readLine()) != null) {
			sb.append(str);
		}
		
		br.close();
		isr.close();
		is.close();
		con.disconnect();
		
		// Online JSON Formatter
		// https://jsonformatter.curiousconcept.com/
		
//		JSONObject jobj = new JSONObject(sb.toString());
//		JSONObject jobj2 = jobj.getJSONObject("result");
//		JSONArray jArray = jobj.getJSONArray("results");
//		for (int i = 0; i < jArray.length(); i++) {
//			JSONObject data = jArray.getJSONObject(i);
//			JSONObject geo = data.getJSONObject("geometry").getJSONObject("location");
//			JSONObject open = data.getJSONObject("opening_hours");
//			System.out.println("名字= " + data.getString("name"));
//			System.out.println("經度= " + geo.getDouble("lng"));
//			System.out.println("緯度 = " + geo.getDouble("lat"));
//			System.out.println("Rating = " + data.getDouble("rating"));
//			if (open.getBoolean("open_now") == true) {
//				System.out.println("開放");
//			} else {
//				System.out.println("開放");
//			}
//			System.out.println("vicinity = " + data.getString("vicinity"));
//			System.out.println("======================");
//		}
		
		JSONArray jArray = new JSONArray(sb.toString());
		for (int i = 0; i < jArray.length(); i++) {
			JSONObject data = jArray.getJSONObject(i);
			
			System.out.println("名字= " + data.getString("Name"));
			System.out.println("電話 = " + data.getString("OperationTel"));
			System.out.println("地址 = " + data.getString("Address"));
			System.out.println("圖片 = " + data.getString("Photo1"));
			System.out.println("評價 = " + data.getDouble("Rate"));
			String[] Latlng = data.getString("LatLng").split(",");
			System.out.println("緯度 = " + Latlng[0]);
			System.out.println("經度 = " + Latlng[1]);
//			System.out.println("經度 = " + data.getDouble("long"));
			System.out.println("開放狀態 = " + data.getString("OpenState"));
			System.out.println("功能 = " + data.getString("GymFuncList"));

			System.out.println("======================");
		}
		
//		GymID":5967,
//	      "Name",
//	      "OperationTel",
//	      "Address":"高雄市鼓山區臨海二路50號",
//	      "Rate":3.5,
//	      "RateCount":2,
//	      "Distance":3.41,
//	      "GymFuncList":"棒球場",
//	      "Photo1":"https://az804957.vo.msecnd.net/photogym/20140611164629_調整大小P1540404.JPG",
//	      "LatLng":"22.6241917710134,120.272108316422",
//	      "RentState":"不開放租借",
//	      "OpenState":"免費開放使用",
//	      "Declaration":null,
//	      "LandAttrName"
		
	}

}
