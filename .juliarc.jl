# This file should contain site-specific commands to be executed on Julia startup
# Users may store their own personal commands in the user home directory `homedir()`, in a file named `.juliarc.jl`

ENV["PYTHON"] = "/Users/michi/anaconda/bin/python"
ENV["JUPYTER"] = "/Users/michi/anaconda/bin/jupyter"

function recompile_packages()
 for pkg in keys(Pkg.installed())
  try
   info("-> Compiling: $pkg")
   eval(Expr(:toplevel, Expr(:using, Symbol(pkg))))
   println("---")
   catch err
   warn("--> Unable to precompile: $pkg")
   warn(err)
   println("---")
  end
 end
end

emerge() = (Pkg.update(); Pkg.build(); recompile_packages())

