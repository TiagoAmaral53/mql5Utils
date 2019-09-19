//+------------------------------------------------------------------+
//|                                                        Utils.mqh |
//|                                                      TiagoAmaral |
//|                     https://github.com/TiagoAmaral53/mql5Parsers |
//+------------------------------------------------------------------+
#property copyright "TiagoAmaral"
#property link      "https://github.com/TiagoAmaral53/mql5Parsers"
#property version   "1.10"

//Some tools that allows me to optimize routines. Such tools as parsers to csv, to json, web requests, file methods to rw
class Utils
  {
private:
   static bool       WriteFile(string relative_path, string textToWrite, string filename, bool rewrite = false); //it writes a file in a relative path , with the textToWrite content
public:
   static bool       MqlRatesToCsv(MqlRates &rates[], string absolute_path_to_write, string filename, bool update); // It parses the mqlRate class to a string csv format.
   static int        GetSymbolAvailable(string &symbolList[], bool market_watch = false); // get all symbols available on your broker. it returns a list of all available curency pairs. If you only want the market watch, make that variable true.
   static void       GetPeriodList(ENUM_TIMEFRAMES &lista[]); // it returns a list of available Timeframes that I want to work on.
   static int        GetPipsFromPrices(double price_one , double price_two, string symbol); //return the number os pips between two prices.
  };

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Utils::MqlRatesToCsv(MqlRates &rates[], string relative_path_to_write, string filename,bool update)
  {
   string csvText= "date,open,high,low,close,tick_volume,spread,real_volume\n";
   for(int i=0; i<ArraySize(rates); i++)
     {
      csvText += rates[i].time+","+rates[i].open+","+rates[i].high+","+rates[i].low+","+rates[i].close+","+rates[i].tick_volume+","+rates[i].spread+","+rates[i].real_volume+"\n";
     }
   if(Utils::WriteFile(relative_path_to_write, csvText, filename, update))
     {
      return true;
     }
   else
     {
      return false;
     }
  }

//+------------------------------------------------------------------+
bool Utils::WriteFile(string relative_path,string textToWrite, string filename, bool rewrite = false)
  {
   FolderCreate(relative_path);
   if(!FileIsExist(relative_path + "\\" + filename) || rewrite)
     {
      int handler = FileOpen(relative_path+"\\" + filename, FILE_WRITE|FILE_CSV);
      FileWrite(handler, textToWrite);
      FileClose(handler);

      return true;
     }
   else
     {
      return false;
     }

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
int Utils::GetPipsFromPrices(double price_1,double price_2 , string symbol){
    double point = SymbolInfoDouble(symbol, SYMBOL_POINT );
    if(point != 0)
      {
       return MathAbs(price_1-price_2)/point;
      }else{
      int decimal_part = SymbolInfoInteger(symbol , SYMBOL_DIGITS);
         double pips = NormalizeDouble(price_1 ,decimal_part)-NormalizeDouble(price_2, decimal_part);
         string decimal = DoubleToString(pips);
         string result[2];
       
         StringSplit(decimal,46, result);
         return StringToInteger(result[1]);
      }
   
}