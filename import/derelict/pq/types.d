/*

Boost Software License - Version 1.0 - August 17th, 2003

Permission is hereby granted, free of charge, to any person or organization
obtaining a copy of the software and accompanying documentation covered by
this license (the "Software") to use, reproduce, display, distribute,
execute, and transmit the Software, and to prepare derivative works of the
Software, and to permit third-parties to whom the Software is furnished to
do so, all subject to the following:

The copyright notices in the Software and this entire statement, including
the above license grant, this restriction and the following disclaimer,
must be included in all copies of the Software, in whole or in part, and
all derivative works of the Software, unless such copies or derivative
works are solely in the form of machine-executable object code generated by
a source language processor.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT
SHALL THE COPYRIGHT HOLDERS OR ANYONE DISTRIBUTING THE SOFTWARE BE LIABLE
FOR ANY DAMAGES OR OTHER LIABILITY, WHETHER IN CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
DEALINGS IN THE SOFTWARE.

*/
module derelict.pq.types;

enum PQVersion : int
{
	PQ_910 = 90100,
	PQ_911 = 90101,
	PQ_912 = 90102,
	PQ_913 = 90103,
	PQ_914 = 90104,
	PQ_915 = 90105,
	PQ_916 = 90106,
	PQ_917 = 90107,
	PQ_918 = 90108,
	PQ_920 = 90200,
	PQ_921 = 90201,
	PQ_922 = 90202,
	PQ_923 = 90203,
	PQ_930 = 90300,
}

extern(C)
{
	alias uint Oid;
	alias char pqbool;
	alias long pg_int64;
	public import std.c.stdio : FILE;

	enum PG_COPYRES_ATTRS       = 0x01;
	enum PG_COPYRES_TUPLES      = 0x02;
	enum PG_COPYRES_EVENTS      = 0x04;
	enum PG_COPYRES_NOTICEHOOKS = 0x08;
	enum valueFormat
	{
		TEXT,
		BINARY
	}
	enum ConnStatusType
	{
		CONNECTION_OK,
		CONNECTION_BAD,
		CONNECTION_STARTED,
		CONNECTION_MADE,
		CONNECTION_AWAITIN_RESPONSE,
		CONNECTION_AUTH_OK,
		CONNECTION_SETENV,
		CONNECTION_SSL_STARTUP,
		CONNECTION_NEEDED
	}
	enum PostgresPollingStatusType
	{
		PGRES_POLLING_FAILED = 0,
		PGRES_POLLING_READING,
		PGRES_POLLING_WRITING,
		PGRES_POLLING_OK,
		PGRES_POLLING_ACTIVE
	}
	enum ExecStatusType
	{
		PGRES_EMPTY_QUERY = 0,
		PGRES_COMMAND_OK,
		PGRES_TUPLES_OK,
		PGRES_COPY_OUT,
		PGRES_COPY_IN,
		PGRES_BAD_RESPONSE,
		PGRES_NONFATAL_ERROR,
		PGRES_FATAL_ERROR,
		PGRES_COPY_BOTH,
		PGRES_SINGLE_TUPLE
	}
	enum PGTransactionStatusType
	{
		PQTRANS_IDLE,
		PQTRANS_ACTIVE,
		PQTRANS_INTRANS,
		PQTRANS_INERROR,
		PQTRANS_UNKNOWN
	}
	enum PGVerbosity
	{
		PQERRORS_TERSE,
		PQERRORS_DEFAULT,
		PQERRORS_VERBOSE
	}
	enum PGPing
	{
		PQPING_OK,
		PQPING_REJECT,
		PQPING_NO_RESPONSE,
		PQPING_NO_ATTEMTP
	}
	struct PGconn {}
	struct PGresult {}
	struct PGcancel {}
	struct PGnotify
	{
		char* relname;
		int be_pid;
		char* extra;
		private PGnotify* next;
	}
	struct PQprintOpt
	{
		pqbool header;
		pqbool aligment;
		pqbool standard;
		pqbool html3;
		pqbool expander;
		pqbool pager;
		char* fieldSep;
		char* tableOpt;
		char* caption;
		char** fieldName;
	}
	struct PQconninfoOption
	{
		char* keyword;
		char* envvar;
		char* compiled;
		char* val;
		char* label;
		char* dispchar;
		int dispsize;
	}
	struct PQArgBlock
	{
		int len;
		int ising;
		union u
		{
			int* ptr;
			int integer;
		}
	}
	struct PGresAttDesc
	{
		char* name;
		Oid tableid;
		int columnid;
		int format;
		Oid typid;
		int typlen;
		int atttypmod;
	}
	enum PGEventId
	{
		PGEVT_REGISTER,
		PGEVT_CONNRESET,
		PGEVT_CONNDESTROY,
		PGEVT_RESULTCREATE,
		PGEVT_RESULTCOPY,
		PGEVT_RESULTDESTROY
	}
	struct PGEventResultCreate
	{
		PGconn* conn;
		PGresult* result;
	}

	alias nothrow void function(void* arg, PGresult* res) PQnoticeReceiver;
	alias nothrow void function(void* arg, char* message) PQnotcieProcessor;
	alias nothrow void function(int acquire) pgthreadlock_t;
	alias nothrow size_t function(PGEventId evtId, void* evtInfo, void* passThrough) PGEventProc;
}