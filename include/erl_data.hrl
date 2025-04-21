%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% MACROS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Macros for Erlang External Term Format
%%% Details at https://www.erlang.org/doc/apps/erts/erl_ext_dist.html
-define(ETF_VERSION, 131).

-define(ETF_131_NEW_FLOAT_EXT,        70). % Finite float (8 bytes IEEE format).
-define(ETF_131_BIT_BINARY_EXT,       77). % Bitstrings (length in bits does not have to be a multiple of 8).
-define(ETF_131_ETFZLIB,              80). % Zlib compressed term format.
-define(ETF_131_ATOM_CACHE_REF,       82). % Refers to atom with AtomCacheReferenceIndex
-define(ETF_131_NEW_PID_EXT,          88). % PID (Creation field has 32 bits).
-define(ETF_131_NEW_PORT_EXT,         89). % Port ID (ID field has 4 bytes (28 bits significant)).
-define(ETF_131_NEWER_REFERENCE_EXT,  90). % References (Creation field has 4 bytes).
-define(ETF_131_SMALL_INTEGER_EXT,    97). % Unsigned 8-bit integers (0..255).
-define(ETF_131_INTEGER_EXT,          98). % Signed 32-bit integers (-2^31)-1..(2^31)-1.
-define(ETF_131_FLOAT_EXT,            99). % Deprecated: 31-byte float.
-define(ETF_131_ATOM_EXT,            100). % Deprecated: Long atoms (Latin-1 encode).
-define(ETF_131_REFERENCE_EXT,       101). % Deprecated: References.
-define(ETF_131_PORT_EXT,            102). % Deprecated: Port ID (Creation field has 1 byte).
-define(ETF_131_PID_EXT,             103). % Deprecated: PID (Creation field has 1 byte (2 bits significant)).
-define(ETF_131_SMALL_TUPLE_EXT,     104). % Tuple with =< 255 elements (Arity field has 1 byte).
-define(ETF_131_LARGE_TUPLE_EXT,     105). % Tuple with > 255 elements (Arity field has 4 bytes).
-define(ETF_131_NIL_EXT,             106). % Empty list.
-define(ETF_131_STRING_EXT,          107). % List with small integers 0..255, e.g. "hello".
-define(ETF_131_LIST_EXT,            108). % Proper list.
-define(ETF_131_BINARY_EXT,          109). % Binaries.
-define(ETF_131_SMALL_BIG_EXT,       110). % Small big integer.
-define(ETF_131_LARGE_BIG_EXT,       111). % Large big integer.
-define(ETF_131_NEW_FUN_EXT,         112). % Internal functions.
-define(ETF_131_EXPORT_EXT,          113). % External functions.
-define(ETF_131_NEW_REFERENCE_EXT,   114). % References (Creation field has 1 byte (2 bits significant)).
-define(ETF_131_SMALL_ATOM_EXT,      115). % Deprecated: Short atoms (Latin-1 encode).
-define(ETF_131_MAP_EXT,             116). % Maps, e.g. #{key => value}.
-define(ETF_131_FUN_EXT,             117). % Removed: Functions.
-define(ETF_131_ATOM_UTF8_EXT,       118). % Atoms (UTF-8 encode and Len field has 2 bytes).
-define(ETF_131_SMALL_ATOM_UTF8_EXT, 119). % Atoms (UTF-8 encode and Len field has 1 byte).
-define(ETF_131_V4_PORT_EXT,         120). % Port ID (ID field has 64 bits).
-define(ETF_131_LOCAL_EXT,           121). % Alternative local ETF intended to only be decoded by a specific local decoder.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% FUNCTIONS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
