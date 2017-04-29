String[] lines = loadStrings("http://www.zaragoza.es/api/recurso/urbanismo-infraestructuras/tranvia.json"); //http://www.zaragoza.es/api/recurso/urbanismo-infraestructuras/tranvia?rf=json&results_only=true&srsname=utm30n");

JSONObject json;

json = loadJSONObject("http://www.zaragoza.es/api/recurso/urbanismo-infraestructuras/tranvia.json"); 
JSONArray results = json.getJSONArray("result");

String parada = "CAMPUS RIO EBRO";

for (int i = 0; i < results.size(); i++) {
    String miParada = results.getJSONObject(i).getString("title");
    if (miParada.equals(parada)) {
      println(miParada);
      JSONArray destinos = results.getJSONObject(i).getJSONArray("destinos"); 
      String ultDestino = "";
      for (int j = 0; j < destinos.size(); j++) {
        if (!ultDestino.equals(destinos.getJSONObject(j).getString("destino"))) {
          ultDestino = destinos.getJSONObject(j).getString("destino"); 
          println(ultDestino);
        }
        println(destinos.getJSONObject(j).getInt("minutos"));
      }
    }
}