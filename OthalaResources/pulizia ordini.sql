set foreign_key_checks = 0;
DELETE FROM ipnmessages;
DELETE FROM orders;
DELETE FROM orders_articles;
DELETE FROM states_orders;
UPDATE product set dtProductState = '2014-12-14 16:00:00';
set foreign_key_checks = 1;