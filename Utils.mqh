//+------------------------------------------------------------------+
//|                                                        Utils.mqh |
//|                                                      TiagoAmaral |
//|                     https://github.com/TiagoAmaral53/mql5Parsers |
//+------------------------------------------------------------------+
#property copyright "TiagoAmaral"
#property link      "https://github.com/TiagoAmaral53/mql5Parsers"
#property version   "1.00"
class Utils
  {
private:
   static bool       WriteFile(string absolute_path, string textToWrite , string filename);
public:
   static bool       MqlRatesToCsv(MqlRates &rates[], string absolute_path_to_write , string filename);
  };

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Utils::MqlRatesToCsv(MqlRates &rates[], string absolute_path_to_write , string filename)
  {
   string csvText= "date,open,high,low,close,tick_volume,spread,real_volume\n";
   for(int i=0; i<ArraySize(rates); i++)
     {
      csvText += rates[i].time+","+rates[i].open+","+rates[i].high+","+rates[i].low+","+rates[i].close+","+rates[i].tick_volume+","+rates[i].spread+","+rates[i].real_volume+"\n";
     }
   if(Utils::WriteFile(absolute_path_to_write, csvText , filename))
     {
      return true;
     }
   else
     {
      return false;
     }
  }

//+------------------------------------------------------------------+
bool Utils::WriteFile(string absolute_path,string textToWrite, string filename){
   
}