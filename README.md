<p align="left">
<img src="./COVID_stack.JPEG" alt="COVID plushie and books" width="300" height=450>
</p>

__Python Ireland November 2025__ <br>
__Modelling the COVID Pandemic in Ireland with Python__ <br>

__Summary__ <br> 
The presentation will introduce common differential models for epidemic models, focusing on their estimation using Bayesian techniques in Python.   

The target audience includes individuals with some Python proficiency and an interest in epidemic modeling but limited prior experience.  

__Python Tools__
Three main libraries were used 
* [PyMC](https://www.pymc.io/welcome.html) for estimation.  These models are in the PYMC directory. <br>
* [CmdPyStan](https://mc-stan.org/cmdstanpy/) for estimates as an interface to the [STAN language](https://mc-stan.org/) These models are in the STAN directory, with STAN files in the STAN/STAN subdirectory <br>
* [ArviZ](https://python.arviz.org/en/stable/) for diagnostics <br>

__Data__ <br>
COVID-19 data examples include <br>
* Influenza infection in a school in England, a common case-study for epidemic models
* A simulated SIR model, which is then re-estimated.  
* Irish case data from February to November 2020 used in modelling by the Irish Epidemiological Modelling Advisory Group (IEMAG) models used by NPHET and the Irish government

__Files__
* Presentation files are given in Keynote, Powerpoint and PDF<br>
* PYMC directory holds PyMC notebooks 1 to 4 are in IPYNB and static copies in HTML.  Created and run in Conda on Windows 11 workstation. <br>
* STAN directory holds STAN models.  cmdpystan notebooks are in IPYNB and static copies also.  Created and run in Windows Subsystem for Linux on Windows 11 workstation. <br>
* Datasets are in the Notebook directories too <br>
* Important papers used for data and methodology guidance are included in the directory Papers <br>

__Contact__<br>
Peter Nolan<br>
databeaker@gmail.com <br>
https://github.com/dpnolan/pandemic <br>

I'm a Dublin-raised and Europe-based risk and data analyst and communicator specialising in financial,  economic analysis.
Consultant business and risk analyst, product and programme manager.  
https://www.linkedin.com/in/peterpatricknolan
