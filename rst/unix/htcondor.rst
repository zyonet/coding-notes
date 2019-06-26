HTCondor
========

HTCondor is a specialized workload management system for compute intensive jobs.
For users, HTCondor is a job scheduler.

You give HTCondor a file containing commands that tell it how to run jobs.
HTCondor locates a machine that can run each job within the pool of machines,
packages up the job and ships it off to this execute machine. The jobs run,
and output is returned to the machine that submitted the jobs.

Click `HTCondor <https://research.cs.wisc.edu/htcondor/description.html>`_ to visit the official website for HTCondor.

Frequently Used Condor Commands
-------------------------------

Using Condor
~~~~~~~~~~~~

1. check status: ``condor_status``
2. check queue: ``condor_q``
3. check users: ``condor_userprio``
4. submit job: ``condor_submit``
5. check job: ``condor_q`` or ``tail``

Job Management
~~~~~~~~~~~~~~

* Remove job:
  * ``condor_rm [job number]``
  * ``condor_rm [jobID.processID]``
  * ``condor_rm [username]``
* See job history:
  * ``condor_histroy [username]``
* See more detail about jobs:
  * ``condor_q -better-analyze [username]``

