# mql5Parsers
Some tools that allows me to optimize routines. Such tools as parsers to csv, to json, web requests, , file methods to rw.

## Install

## Get Started

* Utils Static Class
    * Static Methods
    
    | Methods name | Parameters | Return | Result |
    | ---- | ---- | ---- | ---- |
    | MqlRatesToCsv | MqlRates[] object , string relative_path , string filename , bool to_update : false (optional) | bool | Writes a csv file with the filename parameter, in a relative path |
    | GetSymbolAvailable | string[] empty_list , bool market_watch : false (Optional) // if you want only the symbols on your market_watch  | int // number of available symbols |  empty_list out will have all available string symbols  |
    | GetPeriodList | ENUM_TIMEFRAMES empty_lista[]   | void  |  empty_list out will have all available ENUM_TIMEFRAMES available by me. Rewrite this method to add new timeframes |
    | GetPipsFromPrices | double price1 , double price2, string symbolname | int | It will return the number of pips between those two prices |
    
```mql5
#include <mql5Utils/Utils.mqh>;

//MqlRatesToCsv

int copied=CopyRates(Symbol(),0,0,100,rates);
bool isSaved = Utils::MqlRatesToCsv(copied ,"data_folder", "mysymbol.csv") // It is going to write a filename called mysymbol.csv inside of MQL5/Files/data_folder/mysymbol.csv with copied variable values

//GetSymbolAvailable

string simbolos[];
Utils::GetSymbolAvailable(simbolos, true);
string all_symbols = "";
  for(int i=0; i<ArraySize(simbolos); i++)
     {
     all_symbols += simbolos[i] + "\n"; //
     }
 Comment(all_symbols);
 
// GetPeriodList

   ENUM_TIMEFRAMES timesframes[];
   Utils::GetPeriodList(timesframes);


// Get Pips From two Prices

Comment(Utils::GetPipsFromPrices(1.10630, 1.10326 , Symbol()));
It will print 304
```

   
