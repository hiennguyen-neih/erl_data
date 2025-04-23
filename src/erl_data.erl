-module(erl_data).
-moduledoc """
This module is an OTP library that contains some basic support functions relate
to Erlang data type.
""".

%%--------------------------------------------------------------------------------------------------
%% INCLUDES
%%--------------------------------------------------------------------------------------------------
-include("erl_data.hrl").

%%--------------------------------------------------------------------------------------------------
%% EXPORT FUNCTIONS
%%--------------------------------------------------------------------------------------------------
-export([type_of/1]).

%%--------------------------------------------------------------------------------------------------
%% CODE FOR EXPORTED FUNCTIONS
%%--------------------------------------------------------------------------------------------------

-doc """
Returns data type of Term as an atom if it was a known type, otherwise unknown.

## Note
Return data type for empty list (nil) is list, not string.
The return value port is stand for port ID, not the port itself.

## Examples
```erlang
1> erl_data:type_of(72).
integer
2> erl_data:type_of("hello").
string
3> erl_data:type_of(<<"hello">>).
binary
4> erl_data:type_of(true).
boolean
5> erl_data:type_of(fun() -> io:format("hello") end).
function
6> erl_data:type_of([72, 101, 76, 108, 79]).
string
```
""".
-spec type_of(Term) -> Type when
    Term :: term(), Type :: erl_data_type().
type_of(true) ->
    boolean;
type_of(false) ->
    boolean;
type_of(Term) ->
    ETFTag = binary:at(erlang:term_to_binary(Term), 1),
    etf_tag_to_type(ETFTag).

%%--------------------------------------------------------------------------------------------------
%% CODE FOR INTERNAL FUNCTIONS
%%--------------------------------------------------------------------------------------------------
%% Convert ETF tag to Erlang data type.
etf_tag_to_type(?ETF_131_NEW_FLOAT_EXT)       -> float;
etf_tag_to_type(?ETF_131_BIT_BINARY_EXT)      -> bitstring;
etf_tag_to_type(?ETF_131_NEW_PID_EXT)         -> pid;
etf_tag_to_type(?ETF_131_NEW_PORT_EXT)        -> port;
etf_tag_to_type(?ETF_131_NEWER_REFERENCE_EXT) -> reference;
etf_tag_to_type(?ETF_131_SMALL_INTEGER_EXT)   -> integer;
etf_tag_to_type(?ETF_131_INTEGER_EXT)         -> integer;
etf_tag_to_type(?ETF_131_FLOAT_EXT)           -> float;
etf_tag_to_type(?ETF_131_ATOM_EXT)            -> atom;
etf_tag_to_type(?ETF_131_REFERENCE_EXT)       -> reference;
etf_tag_to_type(?ETF_131_PORT_EXT)            -> port;
etf_tag_to_type(?ETF_131_PID_EXT)             -> pid;
etf_tag_to_type(?ETF_131_SMALL_TUPLE_EXT)     -> tuple;
etf_tag_to_type(?ETF_131_LARGE_TUPLE_EXT)     -> tuple;
etf_tag_to_type(?ETF_131_NIL_EXT)             -> list;
etf_tag_to_type(?ETF_131_STRING_EXT)          -> string;
etf_tag_to_type(?ETF_131_LIST_EXT)            -> list;
etf_tag_to_type(?ETF_131_BINARY_EXT)          -> binary;
etf_tag_to_type(?ETF_131_SMALL_BIG_EXT)       -> integer;
etf_tag_to_type(?ETF_131_LARGE_BIG_EXT)       -> integer;
etf_tag_to_type(?ETF_131_NEW_FUN_EXT)         -> function;
etf_tag_to_type(?ETF_131_EXPORT_EXT)          -> function;
etf_tag_to_type(?ETF_131_NEW_REFERENCE_EXT)   -> reference;
etf_tag_to_type(?ETF_131_SMALL_ATOM_EXT)      -> atom;
etf_tag_to_type(?ETF_131_MAP_EXT)             -> map;
etf_tag_to_type(?ETF_131_ATOM_UTF8_EXT)       -> atom;
etf_tag_to_type(?ETF_131_SMALL_ATOM_UTF8_EXT) -> atom;
etf_tag_to_type(?ETF_131_V4_PORT_EXT)         -> port;
etf_tag_to_type(_)                            -> unknown.
