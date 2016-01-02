-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

-- create Player table

CREATE TABLE player(player_id serial PRIMARY KEY, 
			        player_name text);
			  
-- create Match table

CREATE TABLE match(match_id serial PRIMARY KEY,
				  winner integer REFERENCES player (player_id),
				  loser integer REFERENCES player (player_id)
				  );

-- create view to return Player Standings

CREATE VIEW player_standing_vw as
				select a.player_id, a.player_name, count(c.winner) as wins, count(b.*) as matches 
				from player a left join match b  on (a.player_id = b.winner or a.player_id = b.loser) 
				left join match c on a.player_id = c.winner
				group by a.player_id order by wins desc;
