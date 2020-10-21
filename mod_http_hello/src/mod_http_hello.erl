-module(mod_http_hello).

-behavior(gen_mod).

%% Required by ?INFO_MSG macros
-include("logger.hrl").

%% gen_mod API callbacks
-export([start/2, stop/1, depends/2, mod_options/1, process/2]).

%%%----------------------------------------------------------------------
%%% REQUEST HANDLERS
%%%----------------------------------------------------------------------

process(_LocalPath = ["world"], _Request) ->
  {xmlelement, "html", [{"xmlns", "http://www.w3.org/1999/xhtml"}],
    [{xmlelement, "head", [],
      [{xmlelement, "title", [], []}]},
      {xmlelement, "body", [],
        [{xmlelement, "p", [], [{xmlcdata, "Hello, world!"}]}]}]};

process(LocalPath, _Request) ->
  ?INFO_MSG("=================Request Received Start===================", []),
  ?INFO_MSG("=================Request Received End===================", []),
  {xmlel, "html", [{"xmlns", "http://www.w3.org/1999/xhtml"}],
    [{xmlel, "head", [],
      [{xmlel, "title", [], []}]},
      {xmlel, "body", [],
        [{xmlel, "p", [], [{xmlcdata, "Hello, world!"}]}]}]}.


%%%----------------------------------------------------------------------
%%% BEHAVIOUR CALLBACKS
%%%----------------------------------------------------------------------
start(_Host, _Opts) ->
  ?INFO_MSG("==========================Hello, ejabberd world!==========================", []),
  ok.

stop(_Host) ->
  ?INFO_MSG("==========================Bye bye, ejabberd world!==========================", []),
  ok.

depends(_Host, _Opts) ->
  [].

mod_options(_Host) ->
  [].