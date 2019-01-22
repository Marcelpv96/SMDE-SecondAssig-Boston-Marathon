Executive summary
=================

The aim to this project is simulate the behaviour of a marathon runner,
before he starts the marathon, so it will not take into account, factors
like speed, tired level or something like this.\
\
To deal with that, we have analized the results of boston marathon[^1],
available here: <https://kaggle.com/rojour/boston-results> and from this
data generate a new data set to feed our model.\
\
The model that appears on this document is explained by different parts:
A first part where we will describe the system, then the problem and the
simulation model. Also it is explained the Pre-processing step, the
experiment design and how the model is validated. Finally some
conclusions extracted after doing all this work.

System description
==================

-   **Entities**\
    Our entity is the runner.

-   **Attributes**\
    We have take in consider, three attributes for each one runner:
    Relative temperature, Age and Elevation of birth city.

-   **Activites**\
    We only have [Run](Run) as an activity in our entity.

-   **State of the system**\
    Our system will do the activity [Run](Run) eight times, for our
    eight segments, for each time, the state of the system will change,
    until our entity had been run 42 kilometers and that means that our
    entity is at the end state.

Problem description
===================

The problem that we want to solve is which are the factors that affects
more to a runner who is running a marathon.

Structural and Simplifying Hypotheses
-------------------------------------

-   **Simplifying Hypotheses**

    -   **SH\_01** Gender will not be used as a factor.

    -   **SH\_02** The times that a runner have runned the boston
        marathon will not be used as a factor.

    -   **SH\_03** Bib will not be used as a factor, State, country or
        citizen will not be used as a factor.

-   **Structural Hypotheses**

    -   **EH\_01** The relative temperature will be used as a factor,
        and expressed as Fahrenheit.

    -   **EH\_02** Elevation of birth city will be used as a factor, and
        expressed as meters.

    -   **EH\_03** Age will be used as a factor, and expressed as years.

    -   **EH\_04** A normal distribution with an AVG=0 and STD=2.0 will
        be added.

Model specification
===================

We have defined our model using DEVS:

-   **X:** Set of input events. We do not have input events.

-   **Y:** Set of output events. Only one event 'Run five kilometers',
    our output Event will be a linear regression based on some features
    plus a normal distribution as stochastic factor.

-   **S:** Sequential states, Start which will be the initial state.
    then 5KM, 10KM, 15KM, 20KM, 25KM, 30KM, 35KM, 40KM states, and the
    final state, 'END'.

![Our model.[]{label="Figura 3"}](marat.jpg){#Figura 3}

Codification
============

The model has been programmed using FlexSim and all the code is at,
<https://github.com/Marcelpv96/Boston-Marathon>. The pre-processing has
been done using Python, and the linear regressions of each segment using
R.

Pre-processing {#pre-processing .unnumbered}
--------------

The objective in this part is mix the results of the three years (2015,
2016 and 2017) of boston marathon, and end up having as many numbers as
segments we want. We want this segments, with some factors:

-   **5km:** Time to do this five kilometers. Factors: Age, Relative
    temperature and Elevation of birth city.

-   **10km:** Time to do this five kilometers. Factors: Age, Relative
    temperature and Elevation of birth city.

-   **15km:** Time to do this five kilometers. Factors: Age, Relative
    temperature and Elevation of birth city.

-   **20km:** Time to do this five kilometers. Factors: Age, Relative
    temperature and Elevation of birth city.

-   **25km:** Time to do this five kilometers. Factors: Age, Relative
    temperature and Elevation of birth city.

-   **30km:** Time to do this five kilometers. Factors: Age, Relative
    temperature and Elevation of birth city.

-   **35km:** Time to do this five kilometers. Factors: Age, Relative
    temperature and Elevation of birth city.

-   **40km:** Time to do this finally two kilometers. Factors: Age,
    Relative temperature and Elevation of birth city.

### How to obtaint the diferent factors? {#how-to-obtaint-the-diferent-factors .unnumbered}

-   **Relative temperature:**Using this api call:
    [https://api.darksky.net/forecast/{API-Key}/{latitude},{longitude},{Unix time}](https://api.darksky.net/forecast/{API-Key}/{latitude},{longitude},{Unix time})
    We know the latitude and longitude of Boston, also, the unix time
    that the marathon had been done.

-   **Age:** Directly obtained from the boston marathon results.

-   **Elevation of birth city:** First, we have the city name from the
    results, we have to transform this city name to (latitude,
    longitude), using this api call:
    [https://maps.googleapis.com/maps/api/geocode/json?address= \<CITY\_NAME\> &key=\<API\_KEY\>](https://maps.googleapis.com/maps/api/geocode/json?address= <CITY_NAME> &key=<API_KEY>)
    then using the obtained (latitude, longitude) we are able to use
    another api call to obtain the elevation:
    [https://maps.googleapis.com/maps/api/elevation/json?locations=\<LAT,LON\>&key=\<API\_KEY\>](https://maps.googleapis.com/maps/api/elevation/json?locations=<LAT,LON>&key=<API_KEY>).
    All this process is codified using Python3 in the jupyter-notebook
    at <https://github.com/Marcelpv96/Boston-Marathon>.

Doing this, we will obtain the source files to generate the diferent
linear regression models.

Definition of the experimental framework
========================================

Our DOE, we will use a 2k factorial designs, and then Yates algorithm to
observe the effect of each factor, and the interaction of them. Using a
2k factorial design we will obtain a rapid vision of multiple factors
and an easy analysis, interpretation.

2k matrix elaboration {#k-matrix-elaboration .unnumbered}
---------------------

We have three factors:

-   **Temperature**: The value is measured in Fahrenheit , and goes from
    36.63 until 63.38

-   **Age**: The value is measured in Years, and goes from 18 until 84.

-   **Elevation**: The value is measured in Meters, and goes from -0,96
    until 5096,34

so this will represents eigth diferent scenarios, due to we have a
random factor in our system, we have to do some replications from each
one scenario. Now we will explain how is the processes to obtain the
number of replications.

### First scenario {#first-scenario .unnumbered}

We have the three features, with the following values

  **Temperature**   **Age**   **Elevation**                
  ----------------- --------- --------------- ------- ---- -----------
                                               36.63   18   -0.965361

So now, we will start with ten replications, and we obtain the following
values:

  ---- ----------
   1    11586,31
   2    11580,11
   3    11586,44
   4    11587,75
   5    11588,09
   6    11583,08
   7    11585,97
   8    11585,05
   9    11585,2
   10   11580,67
  ---- ----------

-   The average: 11584.86

-   Variance: 7.56

Now we have to calculate the confidence interval with an alpha value of
0.05, the result is:

-   h = 5.40

-   Confidence interval: 11584.86-h, 11584.56+h $\rightarrow$ \[1179.46,
    11590.26\]

So what that's means? It means that, with a probability of 0.95 the
interval \[1179.46, 11590.26\] contains the real value of the mean. We
have specified that we want a we want an interval between a 5% of the
sample mean with a confidence level of a 95%, we check that we are
fulfilling this, we have to do the following calculus:
$$0.05 * 11584.86 = 579.243$$ This 579.243 is obviously higher than our
5.40 h value, so with 10 replications it is enough.\
\
Now, let's think a little bit, how is it possible? It is due to the
randomness factor added on our model is a normal distribution with a
mean of 0 seconds and standard deviation of two seconds on each five
kilometers, so we are improving the time or getting worse in only a few
seconds on each five kilometers, so it is a very low randomness factor,
it will be more logical use a normal distribution with a standard
deviation of 120 seconds, but for this exercise it is enough with the
used normal distribution.\
\
Now with the same procedure we will put all the scenarios, and fill all
the 2k matrix:

  ------- ------- ------- ------- ---- ------------- -----------
   **+**   **+**   **+**   36.63   18    -0.965361   11584,867
   **+**   **+**   **-**   36.63   18   5096.347656  8857,761
   **+**   **-**   **+**   36.63   84    -0.965361   14407,896
   **+**   **-**   **-**   36.63   84   5096.347656  11680,79
   **-**   **+**   **+**   63.38   18    -0.965361   12139,21
   **-**   **+**   **-**   63.38   18   5096.347656  9416,304
   **-**   **-**   **+**   63.38   84    -0.965361   14966,443
   **-**   **-**   **-**   63.38   84   5096.347656  12239,335
  ------- ------- ------- ------- ---- ------------- -----------

Yates algorithm {#yates-algorithm .unnumbered}
---------------

Conclusions {#conclusions .unnumbered}
-----------

Now we can extract some conclusions, first of all, is clear that a
runner with 84 years old, born in a city at -0.9 meters from the sea
level will do the worst time, on the other hand an athlete of 18 years
old, and born in a city at 5096.347 meters from the sea level, will do
the best time that is: 02:36:56, it is a logical result. Then with the
Yates Algorithm, we can observe which factors affects more to the
result. Here we have the conclusions:

-   **T:** We can observe that the temperature affects positively in the
    performance, it improves the final time.

-   **A:** We can observe that the age affects negatively in the
    performance, it get worse the final time.

-   **TA:** We can observe that the temperature affects positively in
    the performance, it improves the final time.

-   **E:** We can observe that the age affects negatively in the
    performance, it get worse the final time.

-   **TE:** We can observe that the age affects negatively in the
    performance, it get worse the final time..

-   **AE:** We can observe that the age affects negatively in the
    performance, it get worse the final time.

-   **TAE:** We can observe that the temperature affects positively in
    the performance, it improves the final time.

Model validation
================

Our validation of the model will be a Face validation. We will analyze
the results obtained from the simulation model. From this analysis we
will be able to recognize the correctness of a model. In this case, like
in Black Box validation, the model is seen as a whole, implying that the
validation is done over the complete set of hypotheses. Finally, we will
compare the model outputs with Historical Data, and this process will
allows us to understand if the model is behaving as expected.

Face validation {#face-validation .unnumbered}
---------------

We will pick a set of seven different runners, with the real time that
they have done the marathon, and check how different is the output of
the model from the reality:

-   Runner 1:

    -   Age: 21

    -   Temperature: 63.32 F

    -   Elevation: 2355 m

    -   Prediction: 03:03:32

    -   Real-time: 2:12:45

-   Runner 2:

    -   Age: 26

    -   Temperature: 63.32 F

    -   Elevation: 2.101 m

    -   Prediction: 03:09:16

    -   Real-time: 2:13:32

-   Runner 3:

    -   Age: 43

    -   Temperature: 63.32 F

    -   Elevation: 94 m

    -   Prediction: 03:39:24

    -   Real-time: 6:08:15

-   Runner 4:

    -   Age: 52

    -   Temperature: 63.32 F

    -   Elevation: 43 m

    -   Prediction: 03:46:17

    -   Real-time: 5:17:30

-   Runner 5:

    -   Age: 62

    -   Temperature: 63.32 F

    -   Elevation: 30 m

    -   Prediction: 03:53:32

    -   Real-time: 6:11:39

    At this point we are able to extract some conclusions, first of all
    we have to say that our model results are far away from the real
    results of marathon runners, it is due to some reasons: One is that
    we are using only three factors, then we do not have take in account
    if a person is trained or not, so maybe one person with 43 years
    have run a lot of marathons, and he will do a good time, then maybe
    one person his birth town is at 10 meters elevation from sea level
    but then he have trained a lot and he will do a good time at the
    marathon. A lot of factors happens during a marathon and we are not
    taking them in account.

Results /Conclusions
====================

Finally, we can conclude that we have done all the process to develop a
simulation model, first we have described our system, then a brief
description of the problem with the structural and simplifying
hypotheses, then the model specification, next the codification to
obtain the data which will feed our model and finally a experiment
design and validation of the model. Maybe it is not the best model to
predict the behaviour of a runner who will run a marathon due to it is
taking into account only three factors, but this project is a good
approach of how is the process to do a simulation model.

[^1]: <https://en.wikipedia.org/wiki/Boston_Marathon>
