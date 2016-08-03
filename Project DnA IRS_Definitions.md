# IRS_Definitions
Note: This sample library of IRS_Definitions contains examples of the progression of turning legal definitions into Digital and Analogue Terms using pseudocode.  We would expect that once finalised the IRS_Definitions would only contain Digital Terms in the appropriate computing language and Analogue Terms where required (for instance in the BBSW_Reuters definition below).  We would not expect that the original definitions or the formal language versions would be retained.

***
## BBSW Reuters

*Text*	= 
> "BBSW_Reuters" means, for Reset Date, the average mid rate for prime bank eligible securities having a tenor of the Designated Maturity as displayed on the “BBSW” page of the Reuters Monitor System on that Reset Date.
> 
> However, if the average mid rate is not displayed by 10:30 am Sydney time on that day, or if it is displayed but the Calculation Agent determines that there is an obvious error in that rate, BBSW_Reuters means the rate determined by the Calculation Agent in good faith at approximately 10:30 am Sydney time on that day, having regard, to the extent possible, to comparable indices then available.


*Formal language*			= 
```	
BBSW_Reuters:
    for Reset_Date
        if Designated_Maturity_Rate show (Reuters_Screen BBSW by 10:30 Sydney time) on Reset_Date
        	if Calculation_Agent override
                	then  BBSW_Reuters is the rate determined by the Calculation Agent in good faith
                	at approximately 10:30 am Sydney time on that day, having regard, to the extent possible, to
                	comparable indices then available [and inputted into the Digital Terms]         
            else BBSW_Reuters is Designated_Maturity_Rate show (Reuters_Screen BBSW) on Reset_Date specified
        else BBSW_Reuters is the rate determined by the Calculation Agent in good faith at 
            approximately 10:30 am Sydney time on that day, having regard, to the extent possible, to 
            comparable indices then available [and inputted into the Digital Terms]

Designated_Maturity_Rate:
    is average mid rate for prime bank eligible securities with Designated_Maturity specified


```
*Pseudocode*		 	= 	

*Digital Terms*			=	BBSW_Reuters

*Analogue Terms*		=	BBSW_Reuters

```
BBSW_Reuters (ResetDate) = 
        if data.Reuters_BBSW /= ()
            |10:30am 
        && Calculation_Agent /= emit(error_rate)
            |10:00am to 5:00pm 
        then return data.Reuters_BBSW(AVG_MID(Tenor == Designated_Maturity))
        else poll.Calculation_Agent = "Please determine the interest rate in good faith as of 10:30am Sydney time on this day,
                                         having regard, to the extent possible, to comparable indices then available
        && BBSW_Reuters = poll(response)

```
Note: This definition is an example of a function which contains both Digital Terms and Analogue Terms.  The Digital Terms are the determination of the rate through the data obtained from the relevant Reuters page.  The Analogue Terms are the determination of the rate by the Calculation Agent if the Calculation Agent is polled to do so, which will occur in circumstances when the rate is not available on the relevant Reuters page or if the Calculation Agent determines the rate displayed is incorrect.  In the latter scenario, the Calculation Agent will manually override the Digital Terms.

***
## Calculation of a Floating Amount

*Text*	= 
> Subject to the "Negative Interest Rates" provisions, the Floating Amount payable by a party on a Payment Date will be:
>
>(a) if "Compounding" is not specified for the Swap Transaction or that party, an amount calculated on a formula basis for that Payment Date or for the related Calculation Period as follows:
>
>Floating Amount = Calculation Amount * (Floating Rate + Spread) * Floating Rate Day Count Fraction
>
>(b) if "Compounding" is specified to be applicable to the Swap Transaction or that party and "Flat Compounding" is not specified, an amount equal to the sum of the Compounding Period Amounts for each of the Compounding Periods in the related Calculation Period; or
>
>(c ) if "Flat Compounding" is specified to be applicable to the Swap Transaction or that party, an amount equal to the sum of the Basic Compounding Period Amounts for each of the Compounding Periods in the related Calculation Period plus the sum of the Additional Compounding Period Amounts for such Compounding Period. 


*Formal language*			= 
```	
Payable_Amount_Floating:
	for Payment_Date or (Calculation_Period for Payment_Date)
		if Negative_Interest_Rate_Method specified
			if Compounding not specified
				then  Payable_Amount_Floating is (Calculation_Amount * (Floating_Rate + Spread) 
				* Floating_Day_Count_Fraction)
			else if Compounding specified 
				if Flat_Compounding not specified
					then Payable_Amount_Floating is sum (Compounding_Period_Amount for every 
					Compounding_Period specified for (Calculation_Period for Payment_Date))
				else if Flat_Compounding specified
					then  Payable_Amount_Floating is sum (Basic_Compounding_Period_Amount for 
					every Compounding_Period specified for (Calculation_Period for Payment_Date)) 
					+ sum (Additional_Compounding_Period_Amount for every Compounding_Period 
					specified for (Calculation_Period for Payment_Date))
		else if Zero_Interest_Rate_Method specified
			if Compounding not specified
				then  Payable_Amount_Floating is maximum (Calculation_Amount * 
				(Floating_Rate +  Spread)
				* Floating_Rate_Day_Count_Fraction) and 0
			else if Compounding specified 
				if Flat_Compounding not specified
					then  Payable_Amount_Floating is maximum (sum (Compounding_Period_Amount for 
					every Compounding_Period specified for (Calculation_Period for Payment_Date))) 
					and 0
				else if Flat_Compounding specified
					then  Payable_Amount_Floating is maximum (sum (Basic_Compounding_Period_Amount 
					for every Compounding_Period specified for (Calculation_Period for Payment_Date)) 
					+ sum (Additional_Compounding_Period_Amount for every Compounding_Period 
					specified for (Calculation_Period for Payment_Date))) and 0

```
*Pseudocode*			=

*Digital Terms*			=	Payable_Amount_Floating

```
Payable_Amount_Floating = 
	if Negative_Interest_Rate_Method /= ()
	then if Compounding == ()
		then Payable_Amount_Floating = Calculation_Amount * (Floating_Rate + Spread) * Floating_Day_Count_Fraction
	elsif [insert]

```
Note: The pseudocode above only considers certain parts of the formal language that are relevant to the example interest rate swap we have considered.
***
## Financial Centers Function 

*Text*	= 

> Financial Centers. The financial center(s) for each of the following currencies is indicated below:
>
>Currency
>Australian Dollar
>
>
>Financial Center(s)
>Sydney

*Formal language*			= 
```	
FinancialCenter:
	if ListedCurrency equals AUD
		then FinancialCenter is Sydney	

```
*Pseudocode*		 	=

*Digital Term*			=	Financial_Center

```
Financial_Center_floating(Floating_Currency): 
	if Floating_Currency == AUD
	then Financial_Center = Sydney
	elsif Floating_Currency == [insert]
		then Financial_Center = [insert]

Financial_Center_fixed(Fixed_Currency): 
	if Fixed_Currency == AUD
	then Financial_Center = Sydney
	elsif Fixed_Currency == [insert]
	then Financial_Center = [insert]

```
***

## Effective Date

*Text*	= 

> “Effective Date” means, in respect of a Swap Transaction, the date specified as such in the related Confirmation, which date is the first day of the Term of the Swap Transaction. The Effective Date shall not be subject to adjustment in accordance with any Business Day Convention unless the parties specify in the related Confirmation that the Effective Date will be adjusted in accordance with a specified Business Day Convention.

*Formal language*			= 
```	
Effective_Date:
	if Business_Day_Convention specified for Effective_Date
		then Effective_Date is date specified as Effective_Date adjusted with 
		(Business_Day_Convention specified for Effective_Date)
	else if Business_Day_Convention not specified for Effective_Date
		then Effective_Date is date specified as Effective_Date 

```
*Pseudocode*			= 	

*Digital Term*			=	Effective_Date

```
[No further pseudocode is required - this mechanic is included directly in the Interest Rate Swap Digital Terms.]
```
***

Disclaimer:  Please note that the documents provided in the respository are sample documents for discussion purposes only and should not be used for actual transactions.  Nothing in any of these documents constitutes legal advice and KWM accepts no responsibility for their contents.
