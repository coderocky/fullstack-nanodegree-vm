# Swiss Tournament Game program

The swiss tournament program is designed to keep track of players, matches and outcome of a tournament. The program assumes even number of players. 
The program is designed using Python and PostgreSQL.

## Installation instructions

1. Install [Virtualbox](https://www.virtualbox.org/)
2. Install [Vagrant](https://www.vagrantup.com/)
3. Clone the fullstack repository onto the local machine
4. Launch vagrant from the vagrant folder on the fullstack repository clone. This may take some time if it is an initial setup.
5. Login to the virtual machine with the command - `vagrant ssh`
6. Login to the PSQL server by typing `psql` on the virtual machine.
7. Create a database tournament by running - `CREATE DATABASE tournament;`
8. Create the tables and view in the tournament database by running - `\i tournament.sql`

## Running and testing the program

The test_tournament.py can be used to run tests on the program.
