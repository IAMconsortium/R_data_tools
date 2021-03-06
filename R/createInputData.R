#' createInputData
#'
#' Takes given data and provides it in the required data format (magpie)
#'
#' @param x Input data that should be checked, provided as a file path to a reporting file,
#' a quitte object or an object which can be converted to quitte using \code{\link[quitte]{as.quitte}}
#' @param cfg Project configuration that should be used (currently available: "CDLINKS"). Either a project name, a path to a
#' config file or a data frame specifying available variables and corresponding properties as returned by
#' \code{\link{iamProjectConfig}()}.
#' @param ref Reference data for comparison. Either a project name (currently available: "IAMC"), a path to a mif
#' file or a quitte object containing the data.
#' @param verbose Boolean influencing the degree of information returned by the function. \code{verbose=TRUE} returns
#' detailed information whereas \code{verbose=FALSE} returns a summary.
#' @param ... additional data objects which are forwarded to the check functions
#' @return Input named list with elements available for check functions
#' @author Cornelia Auer
#'
#' @importFrom quitte as.quitte is.quitte
#' @importFrom magclass as.magpie collapseNames

createInputData <- function(x, cfg="CDLINKS", ref="IAMC", verbose=TRUE, ...)
{

  # test whether x could be converted to quitte object
  xQitte <- try(as.quitte(x, na.rm=TRUE))
  if(is(xQitte,"try-error")) stop("Incompatible data input format. Data could not be converted to quitte object!")

  #building input data object
  input <- list(x       = xQitte,                # data to be tested
                verbose = verbose,                # verbosity
                cfg     = iamProjectConfig(cfg),  # read project config
                ref     = iamReferenceData(ref)) # additional input data

  return (input)
}
