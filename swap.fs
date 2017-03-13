type company = {
   ID: string;
   office: string;
}

type currency =
| AUD
| USD

let now = System.DateTime.UtcNow
let fixed_notional_amount = 5000000
let fixed_currency = AUD
let fixed_payment_date = [ System.DateTime(2016,9,1); System.DateTime(2016,12,1) ]
let fixed_rate = 0.035

let payableamount now =
   match fixed_payment_date with
   | true > fixed_notional_amount * fixed_rate
   | false > fixed_notional_amount * fixed_rate

let swap =
