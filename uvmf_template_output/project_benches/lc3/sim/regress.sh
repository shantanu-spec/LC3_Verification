make clean
ml questa

export QUESTA_HOME=/mnt/apps/public/COE/mg_apps/questa2024.2/questasim

python3 $UVMF_HOME/scripts/uvmf_bcr.py3 questa  seed:123456 verbosity:UVM_LOW
python3 $UVMF_HOME/scripts/uvmf_bcr.py3 questa  seed:476137 verbosity:UVM_LOW
python3 $UVMF_HOME/scripts/uvmf_bcr.py3 questa  seed:247327 verbosity:UVM_LOW

xml2ucdb -format Excel ./test_plan.xml ./test_plan.ucdb
vcover merge -stats=none -strip 0 -totals sim_and_testplan_merged.ucdb ./*.ucdb
visualizer -viewcov ./sim_and_testplan_merged.ucdb