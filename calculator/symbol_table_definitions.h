#define NSYMS 20 // max number of symbols

struct SymbolTable
{
	char *name;
	double value;
};
typedef struct SymbolTable SymbolTable;
SymbolTable symtab[NSYMS];

SymbolTable *symlook(char *name);








