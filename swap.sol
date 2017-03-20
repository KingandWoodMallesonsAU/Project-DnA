pragma solidity ^0.4.2;

contract swap {
    enum Currency { AUD }

    struct Account {
        string name;
        string number;
        string ref;
    }

    struct Company {
        string id;
        string idtype;
        string Office;
        Account Account_Details;
    }

    struct Rate {
        company Fixed_Payer;
	    int Fixed_Notional_Amount;
	    Currency Fixed_Currency;
	    date Fixed_Payment_Date;
	    //Unadjusted_Fixed_Payment_Date = (2016-09-01, 2016-12-01, 2017-03-01, 2017-06-01)
	    decimal Fixed_Rate;
	    //Fixed_Day_Count_Fraction = Act_365_Fixed
    }

    function Payable_Amount_Fixed() returns (bool success) {

    }

}
