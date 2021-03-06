
initParameter <- function(initStruct = list(), path_id ="", initializeIfFormula = "withWarning")
{
	if (length(initStruct) == 0)
	{
		initStruct <- list(Parameters = list(Path_ID = "", InitializeIfFormula = ""), InitialValues = list(Path_ID = "", InitializeIfFormula = ""))
	}
	if (!is.list(initStruct) == 1)
	{
		stop("initStruct has wrong format.")
	}
	if (path_id == "")
	{
		stop("Input 'path_id' is missing.")
	}
	if (!(toupper(initializeIfFormula) %in% c('ALWAYS','WITHWARNING','NEVER')))
	{
		stop(paste("Wrong input for initializeIfFormula: ", initializeIfFormula," please use always, withWarning or never"))
	}
	if ((length(initStruct$Parameters$Path_ID) == 1) & (initStruct$Parameters$Path_ID[1] == ""))
	{
		initStruct$Parameters$Path_ID <- path_id
		initStruct$Parameters$InitializeIfFormula <- initializeIfFormula
		
	} else {
		initStruct$Parameters$Path_ID <- rbind(initStruct$Parameters$Path_ID, path_id)
		initStruct$Parameters$InitializeIfFormula <- rbind(initStruct$Parameters$InitializeIfFormula, initializeIfFormula)
	}
	return(initStruct)
}
