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
   static bool       WriteFile(string absolute_path, string textToWrite, string filename);
public:
   static bool       MqlRatesToCsv(MqlRates &rates[], string absolute_path_to_write, string filename);
   static int        GetSymbolAvailable(string &symbolList[], bool market_watch = false);
   static void       GetPeriodList(ENUM_TIMEFRAMES &lista[]);
  };

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Utils::MqlRatesToCsv(MqlRates &rates[], string relative_path_to_write, string filename)
  {
   string csvText= "date,open,high,low,close,tick_volume,spread,real_volume\n";
   for(int i=0; i<ArraySize(rates); i++)
     {
      csvText += rates[i].time+","+rates[i].open+","+rates[i].high+","+rates[i].low+","+rates[i].close+","+rates[i].tick_volume+","+rates[i].spread+","+rates[i].real_volume+"\n";
     }
   if(Utils::WriteFile(relative_path_to_write, csvText, filename))
     {
      return true;
     }
   else
     {
      return false;
     }
  }

//+------------------------------------------------------------------+
bool Utils::WriteFile(string relative_path,string textToWrite, string filename)
  {
   FolderCreate(relative_path);

   int handler = FileOpen(relative_path+"\\" + filename, FILE_WRITE|FILE_CSV);
   FileWrite(handler, textToWrite);
   FileClose(handler);

   return true;
  }
//+------------------------------------------------------------------+
int Utils::GetSymbolAvailable(string &symbolList[], bool market_watch = false)
  {
   int symbolsnumber = SymbolsTotal(market_watch);
   ArrayResize(symbolList,symbolsnumber);
   for(int i=0; i<symbolsnumber; i++)
     {
      symbolList[i] = SymbolName(i, market_watch);
     }
   return symbolsnumber;
  }

//+------------------------------------------------------------------+
void Utils::GetPeriodList(ENUM_TIMEFRAMES &lista[])
  {
   ArrayResize(lista, 2);
   lista[0] = PERIOD_H1;
   lista[1] = PERIOD_D1;
  }
//+------------------------------------------------------------------+
