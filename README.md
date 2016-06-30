# DnA Contracts

*Project DnA is about creating an architecture for smart contracts based on the principle that digital terms and analogue terms should both be integrated into a contract so that it is both easily administered and infinitely expressive.*

If this is your first time here, consider having a look at our [alert](http://kwm.com/...) or our "10 points on financial market smart contracts" found [here](http://kwm.com/...).

* * *

## DnA is made up of two strands intertwined…
We propose that a "smart" contract should be made up of a blend of computational code and human discretion to produce a single contract which has the best of both worlds.  We refer to this architecture as "DnA".  This means that there are two types of terms in a contract which wants to become "smart" - **Digital Terms** that can be efficiently automated through a software programe and **Analogue Terms** which cannot.  The Digital Terms and Analogue Terms must fit together seamlessly, there must not be any gaps or inconsistencies.  The Digital Terms and the Analogue Terms comprise one single "smart" contract - the **DnA Contract**.

### The Digital Terms and the usual "life-cycle" of a contract
During the ordinary life-cycle of the contract, when nothing unpredictable is happening, most if not all of the performance of the contract can, in our view, be automated. We suggest that the provisions governing this "business as usual" scenario would all be contained in the Digital Terms.  This creates a significant increase in efficiency compared to a "traditional" contract.

### The Analogue Terms and discretions
There is so much complexity in the marketplace such that it is impossible to predict what will happen after the unpredictable happens.  Human judgment is needed to assess an extraordinary range of possibilities, taking into account facts which are far beyond the scope of any contract.  Attempting to codify such decisions would deprive the parties of a valuable right, as well as potentially draining an enormous amount of computer resources.  In other words, it is just not efficient to try to turn a whole contract into computer code, unless it is truly very simple.

We believe that the most computationally elegant solution is to acknowledge the ability of human actors to make certain decisions better and more efficiently than computers, and, as such, to leave certain computations in their hands. We do this by dividing the computations into those automated by the Digital Terms and those too complex, infrequent or discretionary to be automated, which are placed in the Analogue Terms.

### A seamless bond

The Digital Terms and the Analogue Terms handle distinct computations, and are designed together (rather than replicating existing legal contracts in smart contracts that don't acknowledge the legal agreements, but merely seek to enforce them). This means the two parts of the contract will not conflict by design - facilitating the benefits of a "smart" contract without the risk of complicating the legal framework through inconsistent terms.

### A summary of our smart contract principles

The guiding principles on which we have based our smart contract architecture can be summarised as follows:

> 1. Smart contracts can be incredibly efficient ...
> 2. ... but they aren't a solution for everything.
> 3. The Digital Terms need only govern the ordinary life cycle of contracts to be useful...
> 4. ... and the Analogue Terms are necessary for the remainder of the legal relationship.
> 5. The Analogue Terms should not conflict with the Digital Terms by design...
> 6. ... because the Analogue Terms and the Digital Terms should, together, form a single agreement.
> 7. A smart contract should  have the flexibility to reflect the rights of the parties under "traditional" contracts.

* * *

## Contents of this repository

This repository contains a number of explanatory documents for our DnA contract architecture, as well as an example of how the architecture could be applied to a simple interest rate swap.  Specifically the repository contains the following:

1. a ["BAU" interest rate swap confirmation](http://github.com/KingandWoodMallesonsAU/), for use as a comparison;
2. a [smart contract confirmation](https://github.com/KingandWoodMallesonsAU/Project-DnA/blob/master/Project%20DnA%20Smart%20Contract%20Confirmation) containing Analogue Terms and constituting a record of the terms of the example DnA interest rate swap; 
3. a series of [Digital Terms](https://github.com/KingandWoodMallesonsAU/Project-DnA/blob/master/Project%20DnA%20Digital%20Terms) relating to the example DnA interest rate swap;
4. a [sample library of IRS_Definitions](https://github.com/KingandWoodMallesonsAU/Project-DnA/blob/master/Project%20DnA%20IRS_Definitions.md) housing certain of the functions used by each of the Digital Terms and the Analogue Terms when required; and
5. [Diagrams](http://github.com/KingandWoodMallesonsAU/) modelled on Business Process and Modelling Notation setting out the operational flows of a traditional interest rate swap transaction, and how they would exist as a DnA Contract.

### 1. The "business as usual" interest rate swap confirmation

We provide this by way of context and present it in a format which is similar to that typically used for these types of financial markets transactions.  As is commonly the case, it incorporates by reference a library of definitions.

Interest rate swaps already contain a high degree of standardisation and are well suited to a level of automation. Also, their existing document structure separates out most of the ordinary "life-cycle" (into the confirmation) from most of the "out of the ordinary" events (which are contained in a master agreement).

### 2. Our DnA Contract

We split the terms of the BAU confirmation into terms that are machine computable (the Digital Terms) and terms that are better left to human discretion (the Analogue Terms).

#### 2.1 The smart contract confirmation

This document demonstrates how the Analogue Terms and Digital Terms work together to create a single transaction between the parties. You'll notice that this looks quite similar to the BAU confirmation. That is intentional - to allow the parties to process the transaction in the case of an uplift (see below) and as a record of the terms of the transaction for those unfamiliar with reading computing code. 

However, you will notice a few key differences from the BAU confirmation:

1. The smart contract confirmation refers to the Digital Terms (and contain a hash of them);
2. The smart contract confirmation states that the Analogue Terms referred to in the confirmation and the Digital Terms make up a single transaction; and
3. The smart contract confirmation describes the fields for each input that are automatically filled in from the Digital Terms (so as to prevent conflicting terms).

The significance of the smart contract confirmation, aside from the above, is that it pulls in Analogue Terms applicable to the transaction from a particular library of key terms (called the `IRS_Definitions`) and makes the DnA Contract subject to the terms of a particular master agreement (containing other Analogue Terms applicable to the contract including many of the "out of the ordinary" events such as defaults) already entered into between the parties.

#### 2.2 The Analogue Terms

As noted above, the Analogue Terms of the DnA Contract are contained in the relevant `IRS_Definitions`, which are incorporated by reference into the smart contract confirmation, and the master agreement which the DnA Contract forms part of and is subject to.

#### 2.3 The Digital Terms

These look a little bit different, but essentially follow the same structure as the BAU confirmation.

The first part of the code is not functional, but **declares** that these Digital Terms and the smart contract confirmation containing some of the Analogue Terms (which is hashed in the declaration) form a single transaction subject to the relevant master agreement (also hashed in this declaration).

The Digital Terms then call **libraries** of functions. These are roughly equivalent to the definitions incorporated into a BAU confirmation, but can go further. Our Digital Terms call a number of libraries, including the `IRS_Definitions` library which contains the relevant defined terms relevant to the Digital Terms (as well as those relevant for the Analogue Terms, as discussed above), the `KWM_Regtech` library, which would contain certain functions that facilitate the parties' compliance with certain laws or regulations (e.g. a function that tells the parties whether this transaction must be cleared, and then submits the trade to the relevant clearing house), and other standard libraries (including date and time).

This is followed by a section that is most similar to the BAU confirmation - the **Inputs**. This section describes the agreed variables that make up the DnA interest rate swap. 

*Example 1:*
```
Calculation_Agent = Party_A
```
This tells the Digital Terms that when they discuss the Calculation Agent, they really mean Party A (acting in its capacity as the Calculation Agent). This is a simple variable input.  

*Example 2*

```
Business_Day_Convention = Following_Business_Day_Convention

Termination_Date = Business_Day_Convention(Unadjusted_Termination_Date)
		Unadjusted_Termination_Date = date(2017-06-01)
```
The above states that the termination date selected is the unadjusted termination date 2017-06-01 after the business day convention function (in this case, the following business day convention) is applied to that date: since the unadjusted termination date is Thursday 1 June 2017, the termination date will be the same, since that day is a business day in Sydney.  This is slightly more complex than the variable above, and shows a variable and a function being selected.

We then get to the **functional** parts of the Digital Terms. This calls certain functions and variables on certain events. As this particular DnA Contract is a simple interest rate swap each of the payments are calculated in an identical way. As such, we have defined the functions called on the payment dates, and set them to repeat on each subsequent payment date.

The final part of the Digital Terms are the **overrides**, which are "always on". These listen for messages from a party, which could be the counterparties, the Calculation Agent or even a court or a regulator, and stops the transaction operating through the Digital Terms if requested to. This is a critical feature of the Digital Terms, as it permits the intervention of humans at any time to stop the contract, or at least, cease its automation, if they so choose.

#### 2.4 The Libraries

The Digital Terms and the smart contract confirmation refer to certain terms that aren't defined within those respective documents. Instead, they are pulled from libraries. We expect that over time, much like current market practice in financial markets transactions, these libraries would likely be agreed by market participants producing standardised terms and functions for use by the market.

Other functions that may be imported, however, such as RegTech or financial policy compliance functions, might be imported from the libraries created by the parties themselves, or other service providers or market participants.

We have not presumed to write comprehensive libraries as part of this exercise. Instead, we have provided an extract of a library (the `IRS_Definitions` library) which sets out the progression which could be undertaken to turn legal definitions into Digital and Analogue Terms.  We note that the `IRS_Definitions` do not include all the definitions that are relevant for the DnA Contract.

The `IRS_Definitions` form one of the links between the Digital Terms and the Analogue Terms as they contain both formal English and computational code. This is essential, since we envisage the same libraries of terms and functions to be used and applied regardless of whether the contract is being automatically administered by the Digital Terms, or if the parties are administering it under the Analogue Terms.

### 3. BPMN diagrams

[BPMN](http://www.bpmn.org/), or Business Process Model and Notation, is a well known workflow illustrator.  We present a series of diagrams using elements of BPMN showing the administration of a BAU Interest Rate Swap, and a DnA Interest Rate Swap.

You'll notice that the diagrams are almost identical, but two differences are critical. 

1. Most of the processes in the BAU Interest Rate Swap are done by the Calculation Agent, whereas in the DnA Interest Rate Swap, all but one of those processes have been shifted to the contract to self execute (and, during the 'usual' life-cycle of the contract it can administer itself to its termination without the need for human intervention).
2. There is an initial process that allows for pre-close checks to be run - the contract terminating in its own right if it breaches the policies codified in that part of the process chain.

* * *

## Turning legal code into Digital and Analogue Terms

*How did we go about drafting the Digital Terms?*

We have used a progressive approach to turn existing legal definitions into Digital and Analogue Terms using pseudocode.  The `IRS_Definitions` demonstrate these progressions through a range of examples, and we set out below a more detailed explanation of the method we employed.

### Step 1: Legal English
Take for example a definition for “BBSW Reuters”. The definition could look like this:

>“*BBSW_Reuters*” means, for Reset Date, the average mid rate for prime bank eligible securities having a tenor of the Designated Maturity as displayed on the “*BBSW*” page of the Reuters Monitor System on that Reset Date.

>However, if the average mid rate is not displayed by 10:30 am Sydney time on that day, or if it is displayed but the Calculation Agent determines that there is an obvious error in that rate, BBSW_Reuters means the rate determined by the Calculation Agent in good faith at approximately 10:30 am Sydney time on that day, having regard, to the extent possible, to comparable indices then available.

Whilst this may seem like an easily digestible function for a Calculation Agent to determine the interest rate payable by the Floating Rate Payer on a Payment Date, a computer would find it difficult, or impossible, to process some of the discretions afforded to the Calculation Agent (explaining “good faith” to a bunch of transistors is science fiction without the use of an enormous amount of code or computing power, at least for now).

As such, we have to start translating this definition into a code a computer can understand.

### Step 2: One function per line

We start by turning the above into a series of nested instructions, with one function (where possible) per line:

```
“BBSW_Reuters” means,
	for Reset Date
		the average 
			mid rate
			for prime bank eligible securities 
			having a tenor of the Designated Maturity
			as displayed on the “*BBSW*” page
			of the Reuters Monitor System 
	on that Reset Date.

However
	if the average mid rate is not displayed by 10:30 am Sydney time on that day, 
	or if it is displayed
		but the Calculation Agent determines
			that there is an obvious error in that rate
BBSW_Reuters means 
	the rate determined by the Calculation Agent
		in good faith 
		at approximately 10:30 am Sydney time on that day, 
		having regard, 
			to the extent possible, 
			to comparable indices 
				then available.
```
This allows us to start to consider the computations that make up the definition.

### Step 3: Structured language

Once we have a different computation on each line, we look to use standard computational terms to represent them. Think `if`, `then`, `else` statements.

```
BBSW_Reuters:
	for Reset_Date
		if Designated_Maturity_Rate show (Reuters_Screen BBSW by 10:30 in Sydney) on Reset_Date
			if Calculation_Agent override
				then  BBSW_Reuters is the rate determined by the Calculation Agent in good faith
				at approximately 10:30 am Sydney time on that day, having regard, to the extent possible, to
				comparable indices then available [and inputted into the Digital Terms] 		
			else BBSW_Reuters is Designated_Maturity_Rate show (Reuters_Screen BBSW) on Reset_Date specified
		else BBSW_Reuters is the rate determined by the Calculation Agent in good faith at 
		approximately 10:30 am Sydney time on that day, having regard, to the extent possible, to comparable 
		indices then available [and inputted into the Digital Terms]

Designated_Maturity_Rate:
	is average mid rate for prime bank eligible securities with Designated_Maturity specified 
```

Here we get to our first really interesting part. A computer may be very good at determining and calculating:

1. which rate output from Reuters is the one equal to the designated maturity rate; and
2. how to use that rate to calculate the interest payable for a certain period,

but the second half of the clause is a bit more tricky. We have words like "determined ... in good faith", and "having regard to" and "to the extent possible". Whilst we (and the Calculation Agent) may know exactly what that means - a limited discretion for the Calculation Agent to determine the appropriate rate - a computer might find this a little less elementary. It is hard for software to consider (or "have regard") to a factor without determining how it is to consider that factor.

As such, we believe that it is better to leave the second half of the computation to the most efficient engine for the job - the Calculation Agent, who can "consider in good faith".

Whilst in the above, formal English does this by keeping that computation in its original form, in the final contract, the interplay between the Digital Terms and the Analogue Terms will be more nuanced: the Digital Terms will tell the Calculation Agent to exercise its discretion, and how to do so.

### Step 4: Now you’re thinking with <del>portals</del> functions - pseudocode

Think less `the Calculation Agent determines that there is an obvious error in that rate` and more `Calculation_Agent /= emit(error_rate)`: if the Calculation Agent does not state that the rate contains an error.

They mean the same thing. One in words, the other in a formula. This turns the text into something that is (notionally) computable, though it should be translated into an appropriate language for its application. It goes without saying that it is critical to select the right coding language for this application and to ensure that the expressions used are watertight.

```
BBSW_Reuters (ResetDate) = 
		if data.Reuters_BBSW /= ()
			|10:30am 
		&& Calculation_Agent /= emit(error_rate)
			|10:00am to 5:00pm 
		then return data.Reuters_BBSW(AVG_MID(Tenor == Designated_Maturity))
		else poll.Calculation_Agent = "Please determine the interest rate in good faith as of 10:30am Sydney time on this day,
						having regard, to the extent possible, to comparable indices then available"
		&& BBSW_Reuters = poll(response)

```
That's how we get from something that a person can read to something a computer can read.

#### This is a soft uplift
As you can see, in the DnA Contract the Calculation Agent is not totally redundant. Whereas before the Calculation Agent would be involved in almost all of the calculations under the traditional contract, now under the DnA Contract, many of those calculations are automated, and the Calculation Agent is only involved if an "out of the ordinary" event occurs. We call this a "soft uplift" - the contract is still self-executing, but it requires an input from a party exercising a discretion.

#### There are also hard uplifts 
In our Digital Terms, there is also a term (which we have referred to as `offramp`) that allows the contract to be uplifted from the self-executing Digital Terms at the discretion of each party.

This discretion to uplift the contract is absolute, but unlikely to be exercised unless something out of the ordinary happens. Such events could include:

1. non-payment of obligations;
2. default (in respect of this transaction only);
3. default (in respect of other transaction under the same master agreement);
4. any market disruption event.

When it comes to these and similar events, it is, in our opinion, best to leave decisions to humans who can exercise judgment or make highly nuanced decisions using discretion. As such, we "uplift" the contract from the Digital Terms.

This is where the legal framework is critical. First, our Analogue Terms will carry on where our Digital Terms left off - a clean pass of the transaction. Second, within the Analogue Terms, the mechanisms in the master agreement would now apply and the existing contractual processes would apply.

* * *
# For contributors
This is the project page for Project DnA.

We welcome and look forward to any contributions you may have to this project.

* * *
# Disclaimer
Please note that the documents provided in the respository are sample documents for discussion purposes only and should not be used for actual transactions.  Nothing in any of these documents constitutes legal advice and KWM accepts no responsibility for their contents.

