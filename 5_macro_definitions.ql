import cpp

from Macro m
where m.getName() in ["ntohs","ntohl","ntohll"]
select m,"macros named ntohs, ntohl or ntohll"