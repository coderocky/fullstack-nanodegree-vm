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
				  first_player integer REFERENCES player (player_id),
				  second_player integer REFERENCES player (player_id)
				  );

-- create Player Standings table

CREATE TABLE player_standing(match_id integer PRIMARY KEY REFERENCES match (match_id),
							 winner integer REFERENCES player (player_id)
							 );

-- create view to return Player Standings

CREATE VIEW player_standing_vw as 
			   select a.player_id, a.player_name, count(c.winner) as wins, count(b.*) as matches 
               from player a left join match b  on (a.player_id = b.first_player or a.player_id = b.second_player) 
               left join player_standing c on a.player_id = c.winner and b.match_id = c.match_id 
               group by a.player_id order by wins desc;