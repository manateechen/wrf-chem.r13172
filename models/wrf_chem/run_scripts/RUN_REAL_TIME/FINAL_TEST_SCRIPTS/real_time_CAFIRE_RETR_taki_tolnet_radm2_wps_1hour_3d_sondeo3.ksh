#!/bin/ksh -aux
##########################################################################
# Purpose: Set global environment variables for real_time_wrf_chem
#
#########################################################################
#
set -o
export INITIAL_DATE=2015061000
export FIRST_FILTER_DATE=2015061001
export FIRST_DART_INFLATE_DATE=2015061001
export FIRST_EMISS_INV_DATE=2015061001
#
# START CYCLE DATE-TIME:
export CYCLE_STR_DATE=2015061000
#
# END CYCLE DATE-TIME:
export CYCLE_END_DATE=2015061300
#
export CYCLE_DATE=${CYCLE_STR_DATE}
export NL_FAC_OBS_ERROR_MOPITT=1.00
export NL_FAC_OBS_ERROR_IASI=1.00
export RETRIEVAL_TYPE_MOPITT=RETR
export RETRIEVAL_TYPE_IASI=RAWR
#
export PERT_CHEM_GENER=true
export USE_LOG=false
if [[ ${USE_LOG} == true ]]; then
   export CO_MIN=NULL
   export CO_MAX=NULL
   export O3_MIN=NULL
   export O3_MAX=NULL
   export USE_LOG_CO_LOGIC=.true.
   export USE_LOG_O3_LOGIC=.true.
else
   export CO_MIN=1.e-4
   export CO_MAX=NULL
   export O3_MIN=0.
   export O3_MAX=NULL
   export USE_LOG_CO_LOGIC=.false.
   export USE_LOG_O3_LOGIC=.false.
fi
#
# CPSR Truncation (limit the number of CPSR modes assimilated)
   export NL_USE_CPSR_CO_TRUNC=.false.
   export NL_CPSR_CO_TRUNC_LIM=4
   export NL_USE_CPSR_O3_TRUNC=.false.
   export NL_CPSR_O3_TRUNC_LIM=4
#
# Vertical localizaton flag (0 - retrieval locations; 1 - averaging kernel locations)
   export NL_AIRNOW_O3_VLOC=0
   export NL_TOLNET_O3_VLOC=0
#
# If VARLOC = true, then INDEP_CHEM_ASIM = false
# If INDEP_CHEM_ASIM = true, then VARLOC = false
# VARLOC and INDEP_CHEM_ASIM may both be false but
# they may not both be true
#
export VARLOC=.true.
export INDEP_CHEM_ASIM=.false.
#
export ADD_EMISS=.false.
export EMISS_DAMP_CYCLE=0.5
export EMISS_DAMP_INTRA_CYCLE=0.5
#
BAND_ISO_VAL_CO=.09
#
# Run fine scale forecast only
export RUN_FINE_SCALE=false
#
# Restart fine scale forecast only
export RUN_FINE_SCALE_RESTART=false
export RESTART_DATE=2014072312
#
if [[ ${RUN_FINE_SCALE_RESTART} = "true" ]]; then
   export RUN_FINE_SCALE=true
fi
#
# Run WRF-Chem for failed forecasts
export RUN_SPECIAL_FORECAST=false
export NUM_SPECIAL_FORECAST=1
export SPECIAL_FORECAST_FAC=1.
export SPECIAL_FORECAST_FAC=1./2.
export SPECIAL_FORECAST_FAC=2./3.
#
export SPECIAL_FORECAST_MEM[1]=5
export SPECIAL_FORECAST_MEM[2]=18
export SPECIAL_FORECAST_MEM[3]=22
export SPECIAL_FORECAST_MEM[4]=1
export SPECIAL_FORECAST_MEM[5]=1
export SPECIAL_FORECAST_MEM[6]=1
export SPECIAL_FORECAST_MEM[7]=1
export SPECIAL_FORECAST_MEM[8]=20
export SPECIAL_FORECAST_MEM[9]=21
export SPECIAL_FORECAST_MEM[10]=19
#
# COMPUTER PARAMETERS:
export PROJ_NUMBER=P93300612
export GENERAL_JOB_CLASS=normal+
export GENERAL_TIME_LIMIT=01:40:00
export GENERAL_NODES=1
export GENERAL_TASKS=1
export WRFDA_JOB_CLASS=normal+
export WRFDA_TIME_LIMIT=01:05:00
export WRFDA_NODES=1
export WRFDA_TASKS=1
export SINGLE_JOB_CLASS=normal+
export SINGLE_TIME_LIMIT=01:05:00
export SINGLE_NODES=1
export SINGLE_TASKS=1
export BIO_JOB_CLASS=normal+
export BIO_TIME_LIMIT=01:20:00
export BIO_NODES=1
export BIO_TASKS=1
export FILTER_JOB_CLASS=normal+
export FILTER_TIME_LIMIT=03:30:00
export FILTER_NODES=2-4
export FILTER_TASKS=48
export WRFCHEM_JOB_CLASS=medium+
export WRFCHEM_TIME_LIMIT=16:00:00
export WRFCHEM_NODES=2-4
export WRFCHEM_TASKS=48
#
# Run temporal interpolation for missing background files
# Currently set up for 6 hr forecasts. It can handle up to 24 hr forecasts
export RUN_INTERPOLATE=false
#
export CYCLE_PERIOD=1 #6
export FCST_PERIOD=1 #6
# ASIM_WINDOW should be smaller or equal to FCST_PERIOD/2
#In terms of the format of ASIM_WINDOW, please refer to WRFDA
#WRFDA/var/build/da_advance_time.f90
#NOTE: It can not be decimal, e.g., 0.5
#30m: 30 minutes
export ASIM_WINDOW=30m #3
export MET_INTERVAL_HR=1
export INTERVAL_SECONDS=$((${MET_INTERVAL_HR}*60*60))
export HISTORY_INTERVAL_HR=1
(( HISTORY_INTERVAL_MIN = ${HISTORY_INTERVAL_HR} * 60 ))
export NL_DEBUG_LEVEL=200
#
# CODE VERSIONS:
export WPS_VER=wrfchem3_6_1_m_debug/WPS
export WPS_GEOG_VER=GEOG_DATA
export WRFDA_VER=wrfchem3_6_1_m_debug/WRFDA
export WRF_VER=wrf3_6_1_m_debug/WRFV3
export WRFCHEM_VER=wrfchem3_6_1_ma/WRFV3
export DART_VER=wrf-chem.r13172
#
# ROOT DIRECTORIES:
export SCRATCH_DIR=/home/vy57456/zzbatmos_user/data/dart/CAFIRE
export MODEL_DIR=/home/vy57456/zzbatmos_user/model/gfortran/MPI
export INPUT_DATA_DIR=/home/vy57456/zzbatmos_user/data/dart/CAFIRE
export SCRIPT_DIR=/home/vy57456/zzbatmos_user/model/DART/mizzi/DART_13172/tags/wrf-chem.r13172/models/wrf_chem/run_scripts/RUN_REAL_TIME/FINAL_TEST_SCRIPTS/
#
# DEPENDENT INPUT DATA DIRECTORIES:
export EXPERIMENT_DIR=${SCRATCH_DIR}
export RUN_DIR=${EXPERIMENT_DIR}/real_CAFIRE_RADM2_1hour_3d_sondeo3
export WPS_DIR=${MODEL_DIR}/${WPS_VER}
export WPS_GEOG_DIR=/home/vy57456/zzbatmos_user/data/wrf_input/geog_3.7
export WRFCHEM_DIR=${MODEL_DIR}/${WRFCHEM_VER}
export WRFDA_DIR=${MODEL_DIR}/${WRFDA_VER}
export DART_DIR=/home/vy57456/zzbatmos_user/model/DART/mizzi/DART_13172/tags/${DART_VER}
export BUILD_DIR=${WRFDA_DIR}/var/da
export WRF_DIR=${MODEL_DIR}/${WRF_VER}
export HYBRID_SCRIPTS_DIR=${DART_DIR}/models/wrf_chem/hybrid_scripts
export ADJUST_EMISS_DIR=${DART_DIR}/models/wrf_chem/run_scripts/RUN_EMISS_INV
export WES_COLDENS_DIR=${DART_DIR}/models/wrf_chem/run_scripts/RUN_WES_COLDENS
export MEGAN_BIO_DIR=${DART_DIR}/models/wrf_chem/run_scripts/RUN_MEGAN_BIO
export FINN_FIRE_DIR=${DART_DIR}/models/wrf_chem/run_scripts/RUN_FINN_FIRE
export EXPERIMENT_DATA_DIR=${INPUT_DATA_DIR}/CAFIRE_REAL_TIME_DATA
export MOZBC_DATA_DIR=${EXPERIMENT_DATA_DIR}/mozart_forecasts
export EXPERIMENT_STATIC_FILES=${EXPERIMENT_DATA_DIR}/static_files
export EXPERIMENT_WRFCHEMI_DIR=${EXPERIMENT_DATA_DIR}/anthro_emissions
export EXPERIMENT_WRFFIRECHEMI_DIR=${EXPERIMENT_DATA_DIR}/fire_emissions
export EXPERIMENT_WRFBIOCHEMI_DIR=${EXPERIMENT_DATA_DIR}/bio_emissions
export EXPERIMENT_COLDENS_DIR=${EXPERIMENT_DATA_DIR}/wes_coldens
export EXPERIMENT_PREPBUFR_DIR=${EXPERIMENT_DATA_DIR}/met_obs_prep_data
export EXPERIMENT_AIRNOW_DIR=${EXPERIMENT_DATA_DIR}/airnow_csv_data
export EXPERIMENT_TOLNET_DIR=${EXPERIMENT_DATA_DIR}/tolnet_text_data
export EXPERIMENT_GFS_DIR=${EXPERIMENT_DATA_DIR}/gfs_forecasts
export EXPERIMENT_DUST_DIR=${EXPERIMENT_DATA_DIR}/dust_fields
export EXPERIMENT_HIST_IO_DIR=${EXPERIMENT_DATA_DIR}/hist_io_files
export VTABLE_DIR=${WPS_DIR}/ungrib/Variable_Tables
export BE_DIR=${WRFDA_DIR}/var/run
export PERT_CHEM_INPUT_DIR=${DART_DIR}/models/wrf_chem/run_scripts/RUN_PERT_CHEM/ICBC_PERT
export PERT_CHEM_EMISS_DIR=${DART_DIR}/models/wrf_chem/run_scripts/RUN_PERT_CHEM/EMISS_PERT
export RUN_BAND_DEPTH_DIR=${DART_DIR}/models/wrf_chem/run_scripts/RUN_BAND_DEPTH
#
cp ${DART_DIR}/models/wrf_chem/work/advance_time ./.
cp ${DART_DIR}/models/wrf_chem/work/input.nml ./.

# Setup and run WPS
##########################################################################
export RUN_GEOGRID=false  #true
export RUN_UNGRIB=false    #true
export RUN_METGRID=false     #true
# RUN DIRECTORIES
export GEOGRID_DIR=${RUN_DIR}/geogrid
export UNGRIB_DIR=${RUN_DIR}/ungrib
export METGRID_DIR=${RUN_DIR}/metgrid

export MAX_DOMAINS=03
export CR_DOMAIN=01
export MR_DOMAIN=02
export FR_DOMAIN=03
export NNXP_CR=195
export NNYP_CR=167
export NNZP_CR=36
export NNXP_MR=255
export NNYP_MR=228
export NNZP_MR=36
export NNXP_FR=258
export NNYP_FR=204
export NNZP_FR=36
(( NNXP_STAG_CR=${NNXP_CR}+1 ))
(( NNYP_STAG_CR=${NNYP_CR}+1 ))
(( NNZP_STAG_CR=${NNZP_CR}+1 ))
(( NNXP_STAG_MR=${NNXP_MR}+1 ))
(( NNYP_STAG_MR=${NNYP_MR}+1 ))
(( NNZP_STAG_MR=${NNZP_MR}+1 ))
(( NNXP_STAG_FR=${NNXP_FR}+1 ))
(( NNYP_STAG_FR=${NNYP_FR}+1 ))
(( NNZP_STAG_FR=${NNZP_FR}+1 ))
export ISTR_CR=1
export JSTR_CR=1
export ISTR_MR=80
export JSTR_MR=45
export ISTR_FR=150
export JSTR_FR=55
export DX_CR=27000
export DX_MR=9000
export DX_FR=3000
# TOTAL NUMBER OF gfs FORECAST HOURS
(( LBC_END=6 ))
export LBC_FREQ=6
export LBC_START=0
export START_DATE=${INITIAL_DATE}
export END_DATE=$($BUILD_DIR/da_advance_time.exe ${CYCLE_END_DATE} ${LBC_FREQ} 2>/dev/null)
export START_YEAR=$(echo $START_DATE | cut -c1-4)
export START_YEAR_SHORT=$(echo $START_DATE | cut -c3-4)
export START_MONTH=$(echo $START_DATE | cut -c5-6)
export START_DAY=$(echo $START_DATE | cut -c7-8)
export START_HOUR=$(echo $START_DATE | cut -c9-10)
export START_FILE_DATE=${START_YEAR}-${START_MONTH}-${START_DAY}_${START_HOUR}:00:00
export END_YEAR=$(echo $END_DATE | cut -c1-4)
export END_MONTH=$(echo $END_DATE | cut -c5-6)
export END_DAY=$(echo $END_DATE | cut -c7-8)
export END_HOUR=$(echo $END_DATE | cut -c9-10)
export END_FILE_DATE=${END_YEAR}-${END_MONTH}-${END_DAY}_${END_HOUR}:00:00
#
# LARGE SCALE FORECAST PARAMETERS:
export FG_TYPE=GFS
export GRIB_PART1=gfs.0p25.
export GRIB_PART2=.g2.tar
# WPS PARAMETERS:
export SINGLE_FILE=false
export HOR_SCALE=1500
export VTABLE_TYPE=GFS
export METGRID_TABLE_TYPE=ARW
#########################################################################
#
#  NAMELIST PARAMETERS
#
#########################################################################
#
# WPS SHARE NAMELIST:
export NL_WRF_CORE=\'ARW\'
export NL_MAX_DOM=${MAX_DOMAINS}
export NL_START_YEAR=${START_YEAR},${START_YEAR},${START_YEAR}
export NL_START_MONTH=${START_MONTH},${START_MONTH},${START_MONTH}
export NL_START_DAY=${START_DAY},${START_DAY},${START_DAY}
export NL_START_HOUR=${START_HOUR},${START_HOUR},${START_HOUR}
export NL_END_YEAR=${END_YEAR},${END_YEAR},${END_YEAR}
export NL_END_MONTH=${END_MONTH},${END_MONTH},${END_MONTH}
export NL_END_DAY=${END_DAY},${END_DAY},${END_DAY}
export NL_END_HOUR=${END_HOUR},${END_HOUR},${END_HOUR}
export NL_INTERVAL_SECONDS=${INTERVAL_SECONDS}
export NL_IO_FORM_GEOGRID=2
export NL_OPT_OUTPUT_FROM_GEOGRID_PATH=\'${GEOGRID_DIR}\'
export NL_ACTIVE_GRID=".true.",".true.",".true."
#
# WPS GEOGRID NAMELIST:
export NL_S_WE=1,1,1
export NL_E_WE=${NNXP_STAG_CR},${NNXP_STAG_MR},${NNXP_STAG_FR}
export NL_S_SN=1,1,1
export NL_E_SN=${NNYP_STAG_CR},${NNYP_STAG_MR},${NNYP_STAG_FR}
export NL_S_VERT=1,1,1
export NL_E_VERT=${NNZP_STAG_CR},${NNZP_STAG_MR},${NNZP_STAG_FR}
export NL_PARENT_ID="0,1,2"
export NL_PARENT_GRID_RATIO=1,3,3
export NL_I_PARENT_START=${ISTR_CR},${ISTR_MR},${ISTR_FR}
export NL_J_PARENT_START=${JSTR_CR},${JSTR_MR},${JSTR_FR}
export NL_GEOG_DATA_RES=\'10s\',\'10s\',\'10s\'
export NL_DX=${DX_CR}
export NL_DY=${DX_CR}
export NL_MAP_PROJ=\'lambert\'
export NL_REF_LAT=42.83
export NL_REF_LON=-92.03
export NL_STAND_LON=-98.0
export NL_TRUELAT1=30.0
export NL_TRUELAT2=60.0
export NL_GEOG_DATA_PATH=\'${WPS_GEOG_DIR}\'
export NL_OPT_GEOGRID_TBL_PATH=\'${WPS_DIR}/geogrid\'
#
# WPS UNGRIB NAMELIST:
export NL_OUT_FORMAT=\'WPS\'
#
# WPS METGRID NAMELIST:
export NL_IO_FORM_METGRID=2
#
#########################################################################
#
# CREATE RUN DIRECTORY
#
#########################################################################
#
if [[ ! -e ${RUN_DIR} ]]; then mkdir ${RUN_DIR}; fi
cd ${RUN_DIR}
#
#########################################################################
#
# RUN GEOGRID
#
#########################################################################
#
if [[ ${RUN_GEOGRID} = "true" ]]; then
   mkdir -p ${RUN_DIR}/geogrid
   cd ${RUN_DIR}/geogrid
#
   cp ${WPS_DIR}/geogrid.exe ./.
   export NL_DX=${DX_CR}
   export NL_DY=${DX_CR}
   export NL_START_DATE=${START_DATE}
   export NL_END_DATE=${END_DATE}
   ${HYBRID_SCRIPTS_DIR}/da_create_wps_namelist_RT.ksh
#
   RANDOM=$$
   export JOBRND=${RANDOM}_geogrid
   ${HYBRID_SCRIPTS_DIR}/job_script_taki.ksh ${JOBRND} ${GENERAL_JOB_CLASS} ${GENERAL_TIME_LIMIT} ${GENERAL_NODES} ${GENERAL_TASKS} geogrid.exe SERIAL
   sbatch -W job.ksh
fi
#
#########################################################################
#
# RUN UNGRIB
#
#########################################################################
#
if [[ ${RUN_UNGRIB} = "true" ]]; then
   mkdir -p ${RUN_DIR}/ungrib
   cd ${RUN_DIR}/ungrib
   rm -rf GRIBFILE.*
#
   cp ${VTABLE_DIR}/Vtable.${VTABLE_TYPE} Vtable
   cp ${WPS_DIR}/ungrib.exe ./.
#
   export L_START_DATE=${START_DATE}
   export L_END_DATE=${END_DATE}
   export L_START_YEAR=$(echo $L_START_DATE | cut -c1-4)
   export L_START_MONTH=$(echo $L_START_DATE | cut -c5-6)
   export L_START_DAY=$(echo $L_START_DATE | cut -c7-8)
   export L_START_HOUR=$(echo $L_START_DATE | cut -c9-10)
   export L_END_YEAR=$(echo $L_END_DATE | cut -c1-4)
   export L_END_MONTH=$(echo $L_END_DATE | cut -c5-6)
   export L_END_DAY=$(echo $L_END_DATE | cut -c7-8)
   export L_END_HOUR=$(echo $L_END_DATE | cut -c9-10)
   export NL_START_YEAR=$(echo $L_START_DATE | cut -c1-4),$(echo $L_START_DATE | cut -c1-4),$(echo $L_START_DATE | cut -c1-4)
   export NL_START_MONTH=$(echo $L_START_DATE | cut -c5-6),$(echo $L_START_DATE | cut -c5-6),$(echo $L_START_DATE | cut -c5-6)
   export NL_START_DAY=$(echo $L_START_DATE | cut -c7-8),$(echo $L_START_DATE | cut -c7-8),$(echo $L_START_DATE | cut -c7-8)
   export NL_START_HOUR=$(echo $L_START_DATE | cut -c9-10),$(echo $L_START_DATE | cut -c9-10),$(echo $L_START_DATE | cut -c9-10)
   export NL_END_YEAR=$(echo $L_END_DATE | cut -c1-4),$(echo $L_END_DATE | cut -c1-4),$(echo $L_END_DATE | cut -c1-4)
   export NL_END_MONTH=$(echo $L_END_DATE | cut -c5-6),$(echo $L_END_DATE | cut -c5-6),$(echo $L_END_DATE | cut -c5-6)
   export NL_END_DAY=$(echo $L_END_DATE | cut -c7-8),$(echo $L_END_DATE | cut -c7-8),$(echo $L_END_DATE | cut -c7-8)
   export NL_END_HOUR=$(echo $L_END_DATE | cut -c9-10),$(echo $L_END_DATE | cut -c9-10),$(echo $L_END_DATE | cut -c9-10)
   export NL_START_DATE=\'${L_START_YEAR}-${L_START_MONTH}-${L_START_DAY}_${L_START_HOUR}:00:00\',\'${L_START_YEAR}-${L_START_MONTH}-${L_START_DAY}_${L_START_HOUR}:00:00\',\'${L_START_YEAR}-${L_START_MONTH}-${L_START_DAY}_${L_START_HOUR}:00:00\'
   export NL_END_DATE=\'${L_END_YEAR}-${L_END_MONTH}-${L_END_DAY}_${L_END_HOUR}:00:00\',\'${L_END_YEAR}-${L_END_MONTH}-${L_END_DAY}_${L_END_HOUR}:00:00\',\'${L_END_YEAR}-${L_END_MONTH}-${L_END_DAY}_${L_END_HOUR}:00:00\'
   ${HYBRID_SCRIPTS_DIR}/da_create_wps_namelist_RT.ksh
#
   FILES=''
   if [[ -e ${EXPERIMENT_GFS_DIR} ]]; then
#  
      export START_DATE_UNGRIB=${INITIAL_DATE}
      while [[ ${START_DATE_UNGRIB} -le ${END_DATE} ]]; do
          export START_YEAR_UNGRIB=$(echo $START_DATE_UNGRIB | cut -c1-4)
          export START_MONTH_UNGRIB=$(echo $START_DATE_UNGRIB | cut -c5-6)
          export START_DAY_UNGRIB=$(echo $START_DATE_UNGRIB | cut -c7-8)
          export START_HOUR_UNGRIB=$(echo $START_DATE_UNGRIB | cut -c9-10)
          if [[ ${SINGLE_FILE} == false ]]; then
             (( LBC_ITR=${LBC_START} ))
             if [[ ${LBC_ITR} -lt 1000 ]]; then export CFTM=${LBC_ITR}; fi
             if [[ ${LBC_ITR} -lt 100  ]]; then export CFTM=0${LBC_ITR}; fi
             if [[ ${LBC_ITR} -lt 10   ]]; then export CFTM=00${LBC_ITR}; fi
             if [[ ${LBC_ITR} -eq 0    ]]; then export CFTM=000; fi
             export FILE=${EXPERIMENT_GFS_DIR}/${GRIB_PART1}${START_YEAR_UNGRIB}${START_MONTH_UNGRIB}${START_DAY_UNGRIB}${START_HOUR_UNGRIB}.f${CFTM}.grib2
#             export FILE=${GRIB_PART1}${START_YEAR}${START_MONTH}${START_DAY}_${CCHH}_${CFTM}.grb2
                FILES="${FILES} ${FILE}"
          else
             export FILE=${EXPERIMENT_GFS_DIR}/${L_START_DATE}/GFS_Global_0p5deg_20080612_1800.grib2
             FILES="${FILES} ${FILE}"
          fi
          export START_DATE_UNGRIB=$($BUILD_DIR/da_advance_time.exe ${START_DATE_UNGRIB} ${LBC_FREQ} 2>/dev/null)
      done
   fi
#
# LINK GRIB FILES
   ${WPS_DIR}/link_grib.csh $FILES
#
   RANDOM=$$
   export JOBRND=${RANDOM}_ungrib
   ${HYBRID_SCRIPTS_DIR}/job_script_taki.ksh ${JOBRND} ${GENERAL_JOB_CLASS} ${GENERAL_TIME_LIMIT} ${GENERAL_NODES} ${GENERAL_TASKS} ungrib.exe SERIAL
   sbatch -W job.ksh
fi
#
#########################################################################
#
# RUN METGRID
#
#########################################################################
#
if [[ ${RUN_METGRID} = "true" ]]; then
   mkdir -p ${RUN_DIR}/metgrid
   cd ${RUN_DIR}/metgrid
#
   ln -fs ${GEOGRID_DIR}/geo_em.d${CR_DOMAIN}.nc ./.
   ln -fs ${GEOGRID_DIR}/geo_em.d${MR_DOMAIN}.nc ./.
   ln -fs ${GEOGRID_DIR}/geo_em.d${FR_DOMAIN}.nc ./.
   ln -fs ../ungrib/FILE:* ./.
   ln -fs ${WPS_DIR}/metgrid/METGRID.TBL.${METGRID_TABLE_TYPE} METGRID.TBL
   ln -fs ${WPS_DIR}/metgrid.exe .
#
   export L_START_DATE=${START_DATE}
   export L_END_DATE=${END_DATE}
   export L_START_YEAR=$(echo $L_START_DATE | cut -c1-4)
   export L_START_MONTH=$(echo $L_START_DATE | cut -c5-6)
   export L_START_DAY=$(echo $L_START_DATE | cut -c7-8)
   export L_START_HOUR=$(echo $L_START_DATE | cut -c9-10)
   export L_END_YEAR=$(echo $L_END_DATE | cut -c1-4)
   export L_END_MONTH=$(echo $L_END_DATE | cut -c5-6)
   export L_END_DAY=$(echo $L_END_DATE | cut -c7-8)
   export L_END_HOUR=$(echo $L_END_DATE | cut -c9-10)
   export NL_START_YEAR=$(echo $L_START_DATE | cut -c1-4),$(echo $L_START_DATE | cut -c1-4),$(echo $L_START_DATE | cut -c1-4)
   export NL_START_MONTH=$(echo $L_START_DATE | cut -c5-6),$(echo $L_START_DATE | cut -c5-6),$(echo $L_START_DATE | cut -c5-6)
   export NL_START_DAY=$(echo $L_START_DATE | cut -c7-8),$(echo $L_START_DATE | cut -c7-8),$(echo $L_START_DATE | cut -c7-8)
   export NL_START_HOUR=$(echo $L_START_DATE | cut -c9-10),$(echo $L_START_DATE | cut -c9-10),$(echo $L_START_DATE | cut -c9-10)
   export NL_END_YEAR=$(echo $L_END_DATE | cut -c1-4),$(echo $L_END_DATE | cut -c1-4),$(echo $L_END_DATE | cut -c1-4)
   export NL_END_MONTH=$(echo $L_END_DATE | cut -c5-6),$(echo $L_END_DATE | cut -c5-6),$(echo $L_END_DATE | cut -c5-6)
   export NL_END_DAY=$(echo $L_END_DATE | cut -c7-8),$(echo $L_END_DATE | cut -c7-8),$(echo $L_END_DATE | cut -c7-8)
   export NL_END_HOUR=$(echo $L_END_DATE | cut -c9-10),$(echo $L_END_DATE | cut -c9-10),$(echo $L_END_DATE | cut -c9-10)
   export NL_START_DATE=\'${L_START_YEAR}-${L_START_MONTH}-${L_START_DAY}_${L_START_HOUR}:00:00\',\'${L_START_YEAR}-${L_START_MONTH}-${L_START_DAY}_${L_START_HOUR}:00:00\',\'${L_START_YEAR}-${L_START_MONTH}-${L_START_DAY}_${L_START_HOUR}:00:00\'
   export NL_END_DATE=\'${L_END_YEAR}-${L_END_MONTH}-${L_END_DAY}_${L_END_HOUR}:00:00\',\'${L_END_YEAR}-${L_END_MONTH}-${L_END_DAY}_${L_END_HOUR}:00:00\',\'${L_END_YEAR}-${L_END_MONTH}-${L_END_DAY}_${L_END_HOUR}:00:00\'
   ${HYBRID_SCRIPTS_DIR}/da_create_wps_namelist_RT.ksh
#
   RANDOM=$$
   export JOBRND=${RANDOM}_metgrid
   ${HYBRID_SCRIPTS_DIR}/job_script_taki.ksh ${JOBRND} ${GENERAL_JOB_CLASS} ${GENERAL_TIME_LIMIT} ${GENERAL_NODES} ${GENERAL_TASKS} metgrid.exe SERIAL
   sbatch -W job.ksh
fi
#
# Start of main cycling loop
##########################################################################
while [[ ${CYCLE_DATE} -le ${CYCLE_END_DATE} ]]; do
# Go back to script directory
cd ${SCRIPT_DIR}
export DATE=${CYCLE_DATE}
export YYYY=$(echo $DATE | cut -c1-4)
export YY=$(echo $DATE | cut -c3-4)
export MM=$(echo $DATE | cut -c5-6)
export DD=$(echo $DATE | cut -c7-8)
export HH=$(echo $DATE | cut -c9-10)
export DATE_SHORT=${YY}${MM}${DD}${HH}
export FILE_DATE=${YYYY}-${MM}-${DD}_${HH}:00:00
export PAST_DATE=$(${BUILD_DIR}/da_advance_time.exe ${DATE} -${CYCLE_PERIOD} 2>/dev/null)
export PAST_YYYY=$(echo $PAST_DATE | cut -c1-4)
export PAST_YY=$(echo $PAST_DATE | cut -c3-4)
export PAST_MM=$(echo $PAST_DATE | cut -c5-6)
export PAST_DD=$(echo $PAST_DATE | cut -c7-8)
export PAST_HH=$(echo $PAST_DATE | cut -c9-10)
export PAST_FILE_DATE=${PAST_YYYY}-${PAST_MM}-${PAST_DD}_${PAST_HH}:00:00
export NEXT_DATE=$(${BUILD_DIR}/da_advance_time.exe ${DATE} +${CYCLE_PERIOD} 2>/dev/null)
export NEXT_YYYY=$(echo $NEXT_DATE | cut -c1-4)
export NEXT_YY=$(echo $NEXT_DATE | cut -c3-4)
export NEXT_MM=$(echo $NEXT_DATE | cut -c5-6)
export NEXT_DD=$(echo $NEXT_DATE | cut -c7-8)
export NEXT_HH=$(echo $NEXT_DATE | cut -c9-10)
export NEXT_FILE_DATE=${NEXT_YYYY}-${NEXT_MM}-${NEXT_DD}_${NEXT_HH}:00:00
#
# DART TIME DATA
export DT_YYYY=${YYYY}
export DT_YY=${YY}
export DT_MM=${MM} 
export DT_DD=${DD} 
export DT_HH=${HH} 
(( DT_MM = ${DT_MM} + 0 ))
(( DT_DD = ${DT_DD} + 0 ))
(( DT_HH = ${DT_HH} + 0 ))
if [[ ${HH} -eq 0 ]]; then
   export TMP_DATE=$(${BUILD_DIR}/da_advance_time.exe ${DATE} -1 2>/dev/null)
   export TMP_YYYY=$(echo $TMP_DATE | cut -c1-4)
   export TMP_YY=$(echo $TMP_DATE | cut -c3-4)
   export TMP_MM=$(echo $TMP_DATE | cut -c5-6)
   export TMP_DD=$(echo $TMP_DATE | cut -c7-8)
   export TMP_HH=$(echo $TMP_DATE | cut -c9-10)
   export D_YYYY=${TMP_YYYY}
   export D_YY=${TMP_YY}
   export D_MM=${TMP_MM}
   export D_DD=${TMP_DD}
   export D_HH=24
   (( DD_MM = ${D_MM} + 0 ))
   (( DD_DD = ${D_DD} + 0 ))
   (( DD_HH = ${D_HH} + 0 ))
else
   export D_YYYY=${YYYY}
   export D_YY=${YY}
   export D_MM=${MM}
   export D_DD=${DD}
   export D_HH=${HH}
   (( DD_MM = ${D_MM} + 0 ))
   (( DD_DD = ${D_DD} + 0 ))
   (( DD_HH = ${D_HH} + 0 ))
fi
export D_DATE=${D_YYYY}${D_MM}${D_DD}${D_HH}
#
# CALCULATE GREGORIAN TIMES FOR START AND END OF ASSIMILATION WINDOW
set -A GREG_DATA `echo $DATE 0 -g | ${DART_DIR}/models/wrf_chem/work/advance_time`
export DAY_GREG=${GREG_DATA[0]}
export SEC_GREG=${GREG_DATA[1]}
set -A GREG_DATA `echo $NEXT_DATE 0 -g | ${DART_DIR}/models/wrf_chem/work/advance_time`
export NEXT_DAY_GREG=${GREG_DATA[0]}
export NEXT_SEC_GREG=${GREG_DATA[1]}
export ASIM_MIN_DATE=$($BUILD_DIR/da_advance_time.exe $DATE -$ASIM_WINDOW 2>/dev/null)
export ASIM_MIN_YYYY=$(echo $ASIM_MIN_DATE | cut -c1-4)
export ASIM_MIN_YY=$(echo $ASIM_MIN_DATE | cut -c3-4)
export ASIM_MIN_MM=$(echo $ASIM_MIN_DATE | cut -c5-6)
export ASIM_MIN_DD=$(echo $ASIM_MIN_DATE | cut -c7-8)
export ASIM_MIN_HH=$(echo $ASIM_MIN_DATE | cut -c9-10)
export ASIM_MAX_DATE=$($BUILD_DIR/da_advance_time.exe $DATE +$ASIM_WINDOW 2>/dev/null)
export ASIM_MAX_YYYY=$(echo $ASIM_MAX_DATE | cut -c1-4)
export ASIM_MAX_YY=$(echo $ASIM_MAX_DATE | cut -c3-4)
export ASIM_MAX_MM=$(echo $ASIM_MAX_DATE | cut -c5-6)
export ASIM_MAX_DD=$(echo $ASIM_MAX_DATE | cut -c7-8)
export ASIM_MAX_HH=$(echo $ASIM_MAX_DATE | cut -c9-10)
echo $ASIM_MIN_DATE
set -A temp `echo $ASIM_MIN_DATE 0 -g | ${DART_DIR}/models/wrf_chem/work/advance_time`
export ASIM_MIN_DAY_GREG=${temp[0]}
export ASIM_MIN_SEC_GREG=${temp[1]}
set -A temp `echo $ASIM_MAX_DATE 0 -g | ${DART_DIR}/models/wrf_chem/work/advance_time` 
export ASIM_MAX_DAY_GREG=${temp[0]}
export ASIM_MAX_SEC_GREG=${temp[1]}
#
# SELECT COMPONENT RUN OPTIONS:
if [[ ${RUN_SPECIAL_FORECAST} = "false" ]]; then
   export RUN_REAL=true    #true
   export RUN_PERT_WRFCHEM_MET_IC=false   #true
   export RUN_PERT_WRFCHEM_MET_BC=false   #true
   export RUN_EXO_COLDENS=false   #true
   export RUN_SEASON_WES=false   #true
   export RUN_WRFCHEM_BIO=true    #true
   export RUN_WRFCHEM_FIRE=true  #true
   export RUN_WRFCHEM_CHEMI=false #true
   export RUN_PERT_WRFCHEM_CHEM_ICBC=false    #true
   export RUN_PERT_WRFCHEM_CHEM_EMISS=false   #true
   export RUN_AIRNOW_O3_OBS=false  
   export RUN_TOLNET_O3_OBS=false  
   export RUN_MET_OBS=false  #true
   export RUN_COMBINE_OBS=false #true
   export RUN_PREPROCESS_OBS=false #true
#
   if [[ ${DATE} -eq ${INITIAL_DATE}  ]]; then
      export RUN_WRFCHEM_INITIAL=false #true
      export RUN_DART_FILTER=false
      export RUN_UPDATE_BC=false
      export RUN_ENSEMBLE_MEAN_INPUT=false #true
      export RUN_WRFCHEM_CYCLE_CR=false #true
      export RUN_BAND_DEPTH=false
      export RUN_WRFCHEM_CYCLE_MR=false #true
      export RUN_ENSMEAN_CYCLE_MR=false #true
      export RUN_ENSEMBLE_MEAN_OUTPUT=false #true
   else
      export RUN_WRFCHEM_INITIAL=false
      export RUN_DART_FILTER=false #true
      export RUN_UPDATE_BC=false #true
      export RUN_ENSEMBLE_MEAN_INPUT=false #true
      export RUN_WRFCHEM_CYCLE_CR=false #true
      export RUN_BAND_DEPTH=false
      export RUN_WRFCHEM_CYCLE_MR=false #true
      export RUN_ENSMEAN_CYCLE_MR=false #true
      export RUN_ENSEMBLE_MEAN_OUTPUT=false #true
   fi
else
   export RUN_REAL=false
   export RUN_PERT_WRFCHEM_MET_IC=false
   export RUN_PERT_WRFCHEM_MET_BC=false
   export RUN_EXO_COLDENS=false
   export RUN_SEASON_WES=false
   export RUN_WRFCHEM_BIO=false
   export RUN_WRFCHEM_FIRE=false
   export RUN_WRFCHEM_CHEMI=false
   export RUN_PERT_WRFCHEM_CHEM_ICBC=false
   export RUN_PERT_WRFCHEM_CHEM_EMISS=false
   export RUN_AIRNOW_O3_OBS=false
   export RUN_TOLNET_O3_OBS=false
   export RUN_MET_OBS=false
   export RUN_COMBINE_OBS=false
   export RUN_PREPROCESS_OBS=false
#
   if [[ ${DATE} -eq ${INITIAL_DATE}  ]]; then
      export RUN_WRFCHEM_INITIAL=true
      export RUN_DART_FILTER=false
      export RUN_UPDATE_BC=false
      export RUN_ENSEMBLE_MEAN_INPUT=true
      export RUN_WRFCHEM_CYCLE_CR=false
      export RUN_BAND_DEPTH=false
      export RUN_WRFCHEM_CYCLE_MR=false
      export RUN_ENSMEAN_CYCLE_MR=false
      export RUN_ENSEMBLE_MEAN_OUTPUT=true
   else
      export RUN_WRFCHEM_INITIAL=false
      export RUN_DART_FILTER=false
      export RUN_WRFCHEM_CYCLE_CR=true
      export RUN_UPDATE_BC=false
      export RUN_ENSEMBLE_MEAN_INPUT=true
      export RUN_BAND_DEPTH=false
      export RUN_WRFCHEM_CYCLE_MR=false
      export RUN_ENSMEAN_CYCLE_MR=false
      export RUN_ENSEMBLE_MEAN_OUTPUT=true
   fi
fi
if [[ ${RUN_FINE_SCALE} = "true" ]]; then
   export RUN_REAL=false
   export RUN_PERT_WRFCHEM_MET_IC=false
   export RUN_PERT_WRFCHEM_MET_BC=false
   export RUN_EXO_COLDENS=false
   export RUN_SEASON_WES=false
   export RUN_WRFCHEM_BIO=false
   export RUN_WRFCHEM_FIRE=false
   export RUN_WRFCHEM_CHEMI=false
   export RUN_PERT_WRFCHEM_CHEM_ICBC=false
   export RUN_PERT_WRFCHEM_CHEM_EMISS=false
   export RUN_AIRNOW_O3_OBS=false
   export RUN_TOLNET_O3_OBS=false
   export RUN_MET_OBS=false
   export RUN_COMBINE_OBS=false
   export RUN_PREPROCESS_OBS=false
   export RUN_WRFCHEM_INITIAL=false
   export RUN_DART_FILTER=false
   export RUN_UPDATE_BC=false
   export RUN_ENSEMBLE_MEAN_INPUT=false
   export RUN_WRFCHEM_CYCLE_CR=false
   export RUN_BAND_DEPTH=false
   export RUN_WRFCHEM_CYCLE_MR=false
   export RUN_ENSMEAN_CYCLE_MR=true
   export RUN_ENSEMBLE_MEAN_OUTPUT=false
fi
#
# FORECAST PARAMETERS:
export USE_DART_INFL=true
(( CYCLE_PERIOD_SEC=${CYCLE_PERIOD}*60*60 ))
export NUM_MEMBERS=10
export NNZ_CHEM=19 #10
export NNCHEM_SPC=37 #24
export NNFIRE_SPC=31
export NNBIO_SPC=1
export NZ_CHEMI=${NNZ_CHEM}
export NZ_FIRECHEMI=1
export NCHEMI_EMISS=2
export NFIRECHEMI_EMISS=7
export START_DATE=${DATE}
export END_DATE=$($BUILD_DIR/da_advance_time.exe ${START_DATE} ${FCST_PERIOD} 2>/dev/null)
export START_YEAR=$(echo $START_DATE | cut -c1-4)
export START_YEAR_SHORT=$(echo $START_DATE | cut -c3-4)
export START_MONTH=$(echo $START_DATE | cut -c5-6)
export START_DAY=$(echo $START_DATE | cut -c7-8)
export START_HOUR=$(echo $START_DATE | cut -c9-10)
export START_FILE_DATE=${START_YEAR}-${START_MONTH}-${START_DAY}_${START_HOUR}:00:00
export END_YEAR=$(echo $END_DATE | cut -c1-4)
export END_MONTH=$(echo $END_DATE | cut -c5-6)
export END_DAY=$(echo $END_DATE | cut -c7-8)
export END_HOUR=$(echo $END_DATE | cut -c9-10)
export END_FILE_DATE=${END_YEAR}-${END_MONTH}-${END_DAY}_${END_HOUR}:00:00
#
# RUN DIRECTORIES
export REAL_DIR=${RUN_DIR}/${DATE}/real
export WRFCHEM_MET_IC_DIR=${RUN_DIR}/${DATE}/wrfchem_met_ic
export WRFCHEM_MET_BC_DIR=${RUN_DIR}/${DATE}/wrfchem_met_bc
export EXO_COLDENS_DIR=${RUN_DIR}/${DATE}/exo_coldens
export SEASONS_WES_DIR=${RUN_DIR}/${DATE}/seasons_wes
export WRFCHEM_BIO_DIR=${RUN_DIR}/${DATE}/wrfchem_bio
export WRFCHEM_FIRE_DIR=${RUN_DIR}/${DATE}/wrfchem_fire
export WRFCHEM_CHEMI_DIR=${RUN_DIR}/${DATE}/wrfchem_chemi
export WRFCHEM_CHEM_EMISS_DIR=${RUN_DIR}/${DATE}/wrfchem_chem_emiss
export WRFCHEM_INITIAL_DIR=${RUN_DIR}/${INITIAL_DATE}/wrfchem_initial
export WRFCHEM_CYCLE_CR_DIR=${RUN_DIR}/${DATE}/wrfchem_cycle_cr
export WRFCHEM_CYCLE_MR_DIR=${RUN_DIR}/${DATE}/wrfchem_cycle_mr
export WRFCHEM_LAST_CYCLE_CR_DIR=${RUN_DIR}/${PAST_DATE}/wrfchem_cycle_cr
export PREPBUFR_MET_OBS_DIR=${RUN_DIR}/${DATE}/prepbufr_met_obs
export AIRNOW_O3_OBS_DIR=${RUN_DIR}/${DATE}/airnow_o3_obs
export TOLNET_O3_OBS_DIR=${RUN_DIR}/${DATE}/tolnet_o3_obs
export COMBINE_OBS_DIR=${RUN_DIR}/${DATE}/combine_obs
export PREPROCESS_OBS_DIR=${RUN_DIR}/${DATE}/preprocess_obs
export WRFCHEM_CHEM_ICBC_DIR=${RUN_DIR}/${DATE}/wrfchem_chem_icbc
export DART_FILTER_DIR=${RUN_DIR}/${DATE}/dart_filter
export UPDATE_BC_DIR=${RUN_DIR}/${DATE}/update_bc
export BAND_DEPTH_DIR=${RUN_DIR}/${DATE}/band_depth
export ENSEMBLE_MEAN_INPUT_DIR=${RUN_DIR}/${DATE}/ensemble_mean_input
export ENSEMBLE_MEAN_OUTPUT_DIR=${RUN_DIR}/${DATE}/ensemble_mean_output
export REAL_TIME_DIR=${DART_DIR}/models/wrf_chem/run_scripts/RUN_REAL_TIME
#
export NL_MIN_LAT=10.
export NL_MAX_LAT=80.
export NL_MIN_LON=250.
export NL_MAX_LON=310.
export NNL_MIN_LAT=${NL_MIN_LAT}
export NNL_MAX_LAT=${NL_MAX_LAT}
export NNL_MIN_LON=${NL_MIN_LON}
if [[ ${NL_MIN_LON} -gt 180 ]]; then 
   (( NNL_MIN_LON=${NL_MIN_LON}-360 ))
fi
export NNL_MAX_LON=${NL_MAX_LON}
if [[ ${NL_MAX_LON} -gt 180 ]]; then 
   (( NNL_MAX_LON=${NL_MAX_LON}-360 ))
 fi 
export NL_OBS_PRESSURE_TOP=10000.
#
# PERT CHEM PARAMETERS
export SPREAD_FAC=0.30
export MOZ_SPREAD=${SPREAD_FAC}
export NL_MEAN=1.0
export NL_SPREAD=${SPREAD_FAC}
#
# WRF NAMELIST:
# TIME CONTROL NAMELIST:
export NL_RUN_DAYS=0
export NL_RUN_HOURS=${FCST_PERIOD}
export NL_RUN_MINUTES=0
export NL_RUN_SECONDS=0
export NL_START_YEAR=${START_YEAR},${START_YEAR},${START_YEAR}
export NL_START_MONTH=${START_MONTH},${START_MONTH},${START_MONTH}
export NL_START_DAY=${START_DAY},${START_DAY},${START_DAY}
export NL_START_HOUR=${START_HOUR},${START_HOUR},${START_HOUR}
export NL_START_MINUTE=00,00,00
export NL_START_SECOND=00,00,00
export NL_END_YEAR=${END_YEAR},${END_YEAR},${END_YEAR}
export NL_END_MONTH=${END_MONTH},${END_MONTH},${END_MONTH}
export NL_END_DAY=${END_DAY},${END_DAY},${END_DAY}
export NL_END_HOUR=${END_HOUR},${END_HOUR},${END_HOUR}
export NL_END_MINUTE=00,00,00
export NL_END_SECOND=00,00,00
export NL_INTERVAL_SECONDS=${INTERVAL_SECONDS}
export NL_INPUT_FROM_FILE=".true.",".true.",".true."
export NL_HISTORY_INTERVAL=${HISTORY_INTERVAL_MIN},${HISTORY_INTERVAL_MIN},${HISTORY_INTERVAL_MIN}
export NL_FRAMES_PER_OUTFILE=1,1,1
export NL_RESTART=".false."
export NL_RESTART_INTERVAL=1440
export NL_IO_FORM_HISTORY=2
export NL_IO_FORM_RESTART=2
export NL_FINE_INPUT_STREAM=0,2
export NL_IO_FORM_INPUT=2
export NL_IO_FORM_BOUNDARY=2
export NL_AUXINPUT2_INNAME=\'wrfinput_d\<domain\>\'
export NL_AUXINPUT5_INNAME=\'wrfchemi_d\<domain\>_\<date\>\'
export NL_AUXINPUT6_INNAME=\'wrfbiochemi_d\<domain\>_\<date\>\'
export NL_AUXINPUT7_INNAME=\'wrffirechemi_d\<domain\>_\<date\>\'
export NL_AUXINPUT2_INTERVAL_M=60480,60480,60480
export NL_AUXINPUT5_INTERVAL_M=60,60,60
export NL_AUXINPUT6_INTERVAL_M=60,60,60
export NL_AUXINPUT7_INTERVAL_M=60,60,60
export NL_FRAMES_PER_AUXINPUT2=1,1,1
export NL_FRAMES_PER_AUXINPUT5=1,1,1
export NL_FRAMES_PER_AUXINPUT6=1,1,1
export NL_FRAMES_PER_AUXINPUT7=1,1,1
export NL_IO_FORM_AUXINPUT2=2
export NL_IO_FORM_AUXINPUT5=2
export NL_IO_FORM_AUXINPUT6=2
export NL_IO_FORM_AUXINPUT7=2
export NL_IOFIELDS_FILENAME=\'hist_io_flds_v1\',\'hist_io_flds_v2\',\'hist_io_flds_v3\'
export NL_WRITE_INPUT=".true."
export NL_INPUTOUT_INTERVAL=360
export NL_INPUT_OUTNAME=\'wrfapm_d\<domain\>_\<date\>\'
#
# DOMAINS NAMELIST:
export NL_TIME_STEP=60
export NNL_TIME_STEP=${NL_TIME_STEP}
export NL_TIME_STEP_FRACT_NUM=0
export NL_TIME_STEP_FRACT_DEN=1
export NL_MAX_DOM=${MAX_DOMAINS}
export NL_S_WE=1,1,1
export NL_E_WE=${NNXP_STAG_CR},${NNXP_STAG_MR},${NNXP_STAG_FR}
export NL_S_SN=1,1,1
export NL_E_SN=${NNYP_STAG_CR},${NNYP_STAG_MR},${NNYP_STAG_FR}
export NL_S_VERT=1,1,1
export NL_E_VERT=${NNZP_STAG_CR},${NNZP_STAG_MR},${NNZP_STAG_FR}
export NL_NUM_METGRID_LEVELS=27 #27
export NL_NUM_METGRID_SOIL_LEVELS=4
export NL_DX=${DX_CR},${DX_MR},${DX_FR}
export NL_DY=${DX_CR},${DX_MR},${DX_FR}
export NL_GRID_ID=1,2,3
export NL_PARENT_ID=0,1,2
export NL_I_PARENT_START=${ISTR_CR},${ISTR_MR},${ISTR_FR}
export NL_J_PARENT_START=${JSTR_CR},${JSTR_MR},${JSTR_FR}
export NL_PARENT_GRID_RATIO=1,3,3
export NL_PARENT_TIME_STEP_RATIO=1,3,3 #1,2
export NL_FEEDBACK=0
export NL_SMOOTH_OPTION=1
export NL_LAGRANGE_ORDER=2
export NL_INTERP_TYPE=2
export NL_EXTRAP_TYPE=2
export NL_T_EXTRAP_TYPE=2
export NL_USE_SURFACE=".true."
export NL_USE_LEVELS_BELOW_GROUND=".true."
export NL_LOWEST_LEV_FROM_SFC=".false."
export NL_FORCE_SFC_IN_VINTERP=1
export NL_ZAP_CLOSE_LEVELS=500
export NL_INTERP_THETA=".false."
export NL_HYPSOMETRIC_OPT=2
export NL_P_TOP_REQUESTED=1000.
export NL_ETA_LEVELS=1.000000,0.996200,0.989737,0.982460,0.974381,0.965422,\
0.955498,0.944507,0.932347,0.918907,0.904075,0.887721,0.869715,0.849928,\
0.828211,0.804436,0.778472,0.750192,0.719474,0.686214,0.650339,0.611803,\
0.570656,0.526958,0.480854,0.432582,0.382474,0.330973,0.278674,0.226390,\
0.175086,0.132183,0.096211,0.065616,0.039773,0.018113,0.000000,
#
# PHYSICS NAMELIST:
export NL_MP_PHYSICS=8,8,8
export NL_RA_LW_PHYSICS=4,4,4
export NL_RA_SW_PHYSICS=4,4,4
export NL_RADT=15,3,1
export NL_O3INPUT=2,
export NL_SF_SFCLAY_PHYSICS=1,1,1
export NL_SF_SURFACE_PHYSICS=2,2,2
export NL_BL_PBL_PHYSICS=1,1,1
export NL_BLDT=0,0,0
export NL_CU_PHYSICS=1,1,1
export NL_CUDT=0,0,0
export NL_CUGD_AVEDX=1
export NL_CU_RAD_FEEDBACK=".true.",".true.",".true."
export NL_CU_DIAG=0,0,0
export NL_ISFFLX=1
export NL_IFSNOW=0
export NL_ICLOUD=1
export NL_SURFACE_INPUT_SOURCE=1
export NL_NUM_SOIL_LAYERS=4
export NL_MP_ZERO_OUT=2
#WRFCHEM3.6.1=24; WRFCHEM3.9.1=21
export NL_NUM_LAND_CAT=24 #21
export NL_SF_URBAN_PHYSICS=1,1,1
export NL_MAXIENS=1
export NL_MAXENS=3
export NL_MAXENS2=3
export NL_MAXENS3=16
export NL_ENSDIM=144
#
# DYNAMICS NAMELIST:
export NL_ISO_TEMP=200.
export NL_TRACER_OPT=0,0,0
export NL_W_DAMPING=1
export NL_DIFF_OPT=2
export NL_DIFF_6TH_OPT=0,0,0
export NL_DIFF_6TH_FACTOR=0.12,0.12,0.12
export NL_KM_OPT=4
export NL_DAMP_OPT=1
export NL_ZDAMP=5000,5000,5000
export NL_DAMPCOEF=0.15,0.15,0.15
export NL_NON_HYDROSTATIC=".true.",".true.",".true."
export NL_USE_BASEPARAM_FR_NML=".true."
export NL_MOIST_ADV_OPT=2,2,2
export NL_SCALAR_ADV_OPT=2,2,2
export NL_CHEM_ADV_OPT=2,2,2
export NL_TKE_ADV_OPT=2,2,2
export NL_H_MOM_ADV_ORDER=5,5,5
export NL_V_MOM_ADV_ORDER=3,3,3
export NL_H_SCA_ADV_ORDER=5,5,5
export NL_V_SCA_ADV_ORDER=3,3,3
#
# BDY_CONTROL NAMELIST:
export NL_SPEC_BDY_WIDTH=5
export NL_SPEC_ZONE=1
export NL_RELAX_ZONE=4
export NL_SPECIFIED=".true.",".false.",".false."
export NL_NESTED=".false.",".true.",".true."
#
# QUILT NAMELIST:
export NL_NIO_TASKS_PER_GROUP=0
export NL_NIO_GROUPS=1
#
# NAMELIST CHEM
export NL_KEMIT=${NNZ_CHEM}
#
# APM NO_CHEM
#export NL_CHEM_OPT=0,0
export NL_CHEM_OPT=112,112,112
export NL_BIOEMDT=1,1,1
export NL_PHOTDT=30,30,30 #1,1
export NL_CHEMDT=1,1,1
export NL_IO_STYLE_EMISSIONS=2 #2
export NL_EMISS_INPT_OPT=111,111,111
# since I use NEI emission emiss_opt=3
export NL_EMISS_OPT=3,3,3 #8,8
export NL_EMISS_OPT_VOL=0,0,0
export NL_CHEM_IN_OPT=0,0,0
export NL_PHOT_OPT=3,3,3
export NL_GAS_DRYDEP_OPT=1,1,1
export NL_AER_DRYDEP_OPT=1,1,1
export NL_BIO_EMISS_OPT=3,3,3
export NL_NE_AREA=118
export NL_GAS_BC_OPT=112,112,112
export NL_GAS_IC_OPT=112,112,112
export NL_GAS_BC_OPT=112,112,112
export NL_AER_BC_OPT=112,112,112
export NL_AER_IC_OPT=112,112,112
export NL_GASCHEM_ONOFF=1,1,1
export NL_AERCHEM_ONOFF=1,1,1
#
# APM NO_CHEM
#export NL_WETSCAV_ONOFF=0,0
export NL_WETSCAV_ONOFF=1,1,1
export NL_CLDCHEM_ONOFF=0,0,0
export NL_VERTMIX_ONOFF=1,1,1
export NL_CHEM_CONV_TR=0,0,0
export NL_CONV_TR_WETSCAV=1,1,1
export NL_CONV_TR_AQCHEM=0,0,0
export NL_SEAS_OPT=0
#
# APM NO_CHEM
#export NL_DUST_OPT=0
export NL_DUST_OPT=1
export NL_DMSEMIS_OPT=1
export NL_BIOMASS_BURN_OPT=2,2,2
export NL_PLUMERISEFIRE_FRQ=15,15,15
export NL_SCALE_FIRE_EMISS=".true.",".true.",".true."
export NL_HAVE_BCS_CHEM=".true.",".true.",".true."
#
# APM NO_CHEM
#export NL_AER_RA_FEEDBACK=0,0
export NL_AER_RA_FEEDBACK=1,1,1
export NL_CHEMDIAG=0,1,1
export NL_AER_OP_OPT=1
export NL_OPT_PARS_OUT=1
export NL_HAVE_BCS_UPPER=".false.",".false.",".false."
export NL_FIXED_UBC_PRESS=50.,50.,50.
export NL_FIXED_UBC_INNAME=\'ubvals_b40.20th.track1_1996-2005.nc\'
#
# WRFDA NAMELIST PARAMETERS
# WRFVAR1 NAMELIST:
export NL_PRINT_DETAIL_GRAD=false
export NL_VAR4D=false
export NL_MULTI_INC=0
#
# WRFVAR3 NAMELIST:
export NL_OB_FORMAT=1
export NL_NUM_FGAT_TIME=1
#
# WRFVAR4 NAMELIST:
export NL_USE_SYNOPOBS=true
export NL_USE_SHIPOBS=false
export NL_USE_METAROBS=true
export NL_USE_SOUNDOBS=true
export NL_USE_MTGIRSOBS=false
export NL_USE_PILOTOBS=true
export NL_USE_AIREOBS=true
export NL_USE_GEOAMVOBS=false
export NL_USE_POLARAMVOBS=false
export NL_USE_BOGUSOBS=false
export NL_USE_BUOYOBS=false
export NL_USE_PROFILEROBS=false
export NL_USE_SATEMOBS=false
export NL_USE_GPSPWOBS=false
export NL_USE_GPSREFOBS=false
export NL_USE_SSMIRETRIEVALOBS=false
export NL_USE_QSCATOBS=false
export NL_USE_AIRSRETOBS=false
#
# WRFVAR5 NAMELIST:
export NL_CHECK_MAX_IV=true
export NL_PUT_RAND_SEED=true
#
# WRFVAR6 NAMELIST:
export NL_NTMAX=100
#
# WRFVAR7 NAMELIST:
export NL_JE_FACTOR=1.0
export NL_CV_OPTIONS=3
export NL_AS1=0.25,2.0,1.0
export NL_AS2=0.25,2.0,1.0
export NL_AS3=0.25,2.0,1.0
export NL_AS4=0.25,2.0,1.0
export NL_AS5=0.25,2.0,1.0
#
# WRFVAR11 NAMELIST:
export NL_CV_OPTIONS_HUM=1
export NL_CHECK_RH=2
export NL_SEED_ARRAY1=$(${BUILD_DIR}/da_advance_time.exe ${DATE} 0 -f hhddmmyycc)
export NL_SEED_ARRAY2=`echo ${NUM_MEMBERS} \* 100000 | bc -l `
export NL_CALCULATE_CG_COST_FN=true
export NL_LAT_STATS_OPTION=false
#
# WRFVAR15 NAMELIST:
export NL_NUM_PSEUDO=0
export NL_PSEUDO_X=0
export NL_PSEUDO_Y=0
export NL_PSEUDO_Z=0
export NL_PSEUDO_ERR=0.0
export NL_PSEUDO_VAL=0.0
#
# WRFVAR16 NAMELIST:
export NL_ALPHACV_METHOD=2
export NL_ENSDIM_ALPHA=0
export NL_ALPHA_CORR_TYPE=3
export NL_ALPHA_CORR_SCALE=${HOR_SCALE}
export NL_ALPHA_STD_DEV=1.0
export NL_ALPHA_VERTLOC=false
export NL_ALPHA_TRUNCATION=1
#
# WRFVAR17 NAMELIST:
export NL_ANALYSIS_TYPE=\'RANDOMCV\'
#
# WRFVAR18 NAMELIST:
export ANALYSIS_DATE=$(${BUILD_DIR}/da_advance_time.exe ${DATE} 0 -W 2>/dev/null)
#
# WRFVAR19 NAMELIST:
export NL_PSEUDO_VAR=\'t\'
#
# WRFVAR21 NAMELIST:
export NL_TIME_WINDOW_MIN=\'$(${BUILD_DIR}/da_advance_time.exe ${DATE} -${ASIM_WINDOW} -W 2>/dev/null)\'
#
# WRFVAR22 NAMELIST:
export NL_TIME_WINDOW_MAX=\'$(${BUILD_DIR}/da_advance_time.exe ${DATE} +${ASIM_WINDOW} -W 2>/dev/null)\'
#
# WRFVAR23 NAMELIST:
export NL_JCDFI_USE=false
export NL_JCDFI_IO=false
#
# DART input.nml parameters
# &filter.nml
export NL_OUTLIER_THRESHOLD=3.
export NL_ENABLE_SPECIAL_OUTLIER_CODE=.false.
export NL_SPECIAL_OUTLIER_THRESHOLD=3.
export NL_ENS_SIZE=${NUM_MEMBERS}
export NL_OUTPUT_RESTART=.true.
export NL_START_FROM_RESTART=.true.
export NL_OBS_SEQUENCE_IN_NAME="'obs_seq.out'"       
export NL_OBS_SEQUENCE_OUT_NAME="'obs_seq.final'"
export NL_RESTART_IN_FILE_NAME="'filter_ic_old'"       
export NL_RESTART_OUT_FILE_NAME="'filter_ic_new'"       
set -A temp `echo ${ASIM_MIN_DATE} 0 -g | ${DART_DIR}/models/wrf_chem/work/advance_time`
(( temp[1]=${temp[1]}+1 ))
export NL_FIRST_OBS_DAYS=${temp[0]}
export NL_FIRST_OBS_SECONDS=${temp[1]}
set -A temp `echo ${ASIM_MAX_DATE} 0 -g | ${DART_DIR}/models/wrf_chem/work/advance_time`
export NL_LAST_OBS_DAYS=${temp[0]}
export NL_LAST_OBS_SECONDS=${temp[1]}
export NL_NUM_OUTPUT_STATE_MEMBERS=0
export NL_NUM_OUTPUT_OBS_MEMBERS=${NUM_MEMBERS}
if ${USE_DART_INFL}; then
   export NL_INF_FLAVOR_PRIOR=2
else 
   export NL_INF_FLAVOR_PRIOR=0
fi
export NL_INF_FLAVOR_POST=0  
if [[ ${START_DATE} -eq ${FIRST_DART_INFLATE_DATE} ]]; then
   export NL_INF_INITIAL_FROM_RESTART_PRIOR=.false.
   export NL_INF_SD_INITIAL_FROM_RESTART_PRIOR=.false.
   export NL_INF_INITIAL_FROM_RESTART_POST=.false.
   export NL_INF_SD_INITIAL_FROM_RESTART_POST=.false.
else
   export NL_INF_INITIAL_FROM_RESTART_PRIOR=.true.
   export NL_INF_SD_INITIAL_FROM_RESTART_PRIOR=.true.
   export NL_INF_INITIAL_FROM_RESTART_POST=.true.
   export NL_INF_SD_INITIAL_FROM_RESTART_POST=.true.
fi
export NL_INF_IN_FILE_NAME_PRIOR="'prior_inflate_ic_old'"
export NL_INF_IN_FILE_NAME_POST="'post_inflate_ics'"
export NL_INF_OUT_FILE_NAME_PRIOR="'prior_inflate_ic_new'"
export NL_INF_OUT_FILE_NAME_POST="'prior_inflate_restart'"
export NL_INF_DIAG_FILE_NAME_PRIOR="'prior_inflate_diag'"
export NL_INF_DIAG_FILE_NAME_POST="'post_inflate_diag'"
export NL_INF_INITIAL_PRIOR=1.0
export NL_INF_INITIAL_POST=1.0
export NL_INF_SD_INITIAL_PRIOR=0.6
export NL_INF_SD_INITIAL_POST=0.0
export NL_INF_DAMPING_PRIOR=0.9
export NL_INF_DAMPING_POST=1.0
export NL_INF_LOWER_BOUND_PRIOR=1.0
export NL_INF_LOWER_BOUND_POST=1.0
export NL_INF_UPPER_BOUND_PRIOR=100.0
export NL_INF_UPPER_BOUND_POST=100.0
export NL_INF_SD_LOWER_BOUND_PRIOR=0.6
export NL_INF_SD_LOWER_BOUND_POST=0.0
#
# &assim_tools_nml
export NL_CUTOFF=0.1
export NL_SPECIAL_LOCALIZATION_OBS_TYPES="'IASI_CO_RETRIEVAL','MOPITT_CO_RETRIEVAL'"
export NL_SAMPLING_ERROR_CORRECTION=.true.
# original cutoff
export NL_SPECIAL_LOCALIZATION_CUTOFFS=0.05,0.05
export NL_SPECIAL_LOCALIZATION_CUTOFFS=0.1,0.1
export NL_ADAPTIVE_LOCALIZATION_THRESHOLD=2000
#
# &ensemble_manager_nml
export NL_SINGLE_RESTART_FILE_IN=.false.       
export NL_SINGLE_RESTART_FILE_OUT=.false.       
#
# &assim_model_nml
export NL_WRITE_BINARY_RESTART_FILE=.true.
#
# &model_nml
export NL_ADD_EMISS=${ADD_EMISS}
export NL_USE_VARLOC=${VARLOC}
export NL_USE_INDEP_CHEM_ASSIM=${INDEP_CHEM_ASIM}
export NL_DEFAULT_STATE_VARIABLES=.false.
export NL_CONV_STATE_VARIABLES="'U',     'KIND_U_WIND_COMPONENT',     'TYPE_U',  'UPDATE','999',
          'V',     'KIND_V_WIND_COMPONENT',     'TYPE_V',  'UPDATE','999',
          'W',     'KIND_VERTICAL_VELOCITY',    'TYPE_W',  'UPDATE','999',
          'PH',    'KIND_GEOPOTENTIAL_HEIGHT',  'TYPE_GZ', 'UPDATE','999',
          'T',     'KIND_POTENTIAL_TEMPERATURE','TYPE_T',  'UPDATE','999',
          'MU',    'KIND_PRESSURE',             'TYPE_MU', 'UPDATE','999',
          'QVAPOR','KIND_VAPOR_MIXING_RATIO',   'TYPE_QV', 'UPDATE','999',
          'QRAIN', 'KIND_RAINWATER_MIXING_RATIO','TYPE_QRAIN', 'UPDATE','999',
          'QCLOUD','KIND_CLOUD_LIQUID_WATER',   'TYPE_QCLOUD', 'UPDATE','999',
          'QSNOW', 'KIND_SNOW_MIXING_RATIO',    'TYPE_QSNOW', 'UPDATE','999',
          'QICE',  'KIND_CLOUD_ICE',            'TYPE_QICE', 'UPDATE','999',
          'U10',   'KIND_U_WIND_COMPONENT',     'TYPE_U10','UPDATE','999',
          'V10',   'KIND_V_WIND_COMPONENT',     'TYPE_V10','UPDATE','999',
          'T2',    'KIND_TEMPERATURE',          'TYPE_T2', 'UPDATE','999',
          'TH2',   'KIND_POTENTIAL_TEMPERATURE','TYPE_TH2','UPDATE','999',
          'Q2',    'KIND_SPECIFIC_HUMIDITY',    'TYPE_Q2', 'UPDATE','999',
          'PSFC',  'KIND_PRESSURE',             'TYPE_PS', 'UPDATE','999',
          'o3',    'KIND_O3',                   'TYPE_O3', 'UPDATE','999',
          'co',    'KIND_CO',                   'TYPE_CO', 'UPDATE','999',
          'no',    'KIND_NO',                   'TYPE_NO', 'UPDATE','999',
          'no2',   'KIND_NO2',                  'TYPE_NO2', 'UPDATE','999',
          'hno3',  'KIND_HNO3',                 'TYPE_HNO3', 'UPDATE','999',
          'hno4',  'KIND_HNO4',                 'TYPE_HNO4', 'UPDATE','999',
          'n2o5',  'KIND_N2O5',                 'TYPE_N2O5', 'UPDATE','999',
          'c2h6',  'KIND_C2H6',                 'TYPE_C2H6', 'UPDATE','999',
          'acet',  'KIND_ACET',                 'TYPE_ACET', 'UPDATE','999',
          'hcho',  'KIND_HCHO',                 'TYPE_HCHO', 'UPDATE','999',
          'c2h4',  'KIND_C2H4',                 'TYPE_C2H4', 'UPDATE','999',
          'c3h6',  'KIND_C3H6',                 'TYPE_C3H6', 'UPDATE','999',
          'tol',   'KIND_TOL',                  'TYPE_TOL', 'UPDATE','999',
          'mvk',   'KIND_MVK',                  'TYPE_MVK', 'UPDATE','999',
          'bigalk','KIND_BIGALK',               'TYPE_BIGALK', 'UPDATE','999',
          'isopr', 'KIND_ISOPR',                'TYPE_ISOPR', 'UPDATE','999',
          'macr',  'KIND_MACR',                 'TYPE_MACR', 'UPDATE','999',
          'c3h8',  'KIND_C3H8',                 'TYPE_C3H8', 'UPDATE','999',
          'c10h16','KIND_C10H16',               'TYPE_C10H16', 'UPDATE','999',
          'DUST_1','KIND_DST01',                'TYPE_DST01','UPDATE','999',
          'DUST_2','KIND_DST02',                'TYPE_DST02','UPDATE','999',
          'DUST_3','KIND_DST03',                'TYPE_DST03','UPDATE','999',
          'DUST_4','KIND_DST04',                'TYPE_DST04','UPDATE','999',
          'DUST_5','KIND_DST05',                'TYPE_DST05','UPDATE','999',
          'BC1','KIND_CB1',                     'TYPE_EXTCOF','UPDATE','999',
          'BC2','KIND_CB2',                     'TYPE_EXTCOF','UPDATE','999',
          'OC1','KIND_OC1',                     'TYPE_EXTCOF','UPDATE','999',
          'OC2','KIND_OC2',                     'TYPE_EXTCOF','UPDATE','999',
          'sulf','KIND_SO4',                    'TYPE_SO4'   ,'UPDATE','999',
          'TAUAER1','KIND_TAUAER1',             'TYPE_EXTCOF','UPDATE','999',
          'TAUAER2','KIND_TAUAER2',             'TYPE_EXTCOF','UPDATE','999',
          'TAUAER3','KIND_TAUAER3',             'TYPE_EXTCOF','UPDATE','999',
          'TAUAER4','KIND_TAUAER4',             'TYPE_EXTCOF','UPDATE','999',
          'PM10','KIND_PM10',                   'TYPE_EXTCOF','UPDATE','999',
          'PM2_5_DRY','KIND_PM25' ,             'TYPE_EXTCOF','UPDATE','999',
          'P10','KIND_PM10',                    'TYPE_EXTCOF','UPDATE','999',
          'P25','KIND_PM25',                    'TYPE_EXTCOF','UPDATE','999',
          'SEAS_1','KIND_SSLT01',               'TYPE_EXTCOF','UPDATE','999',
          'SEAS_2','KIND_SSLT02',               'TYPE_EXTCOF','UPDATE','999',
          'SEAS_3','KIND_SSLT03',               'TYPE_EXTCOF','UPDATE','999',
          'SEAS_4','KIND_SSLT04',               'TYPE_EXTCOF','UPDATE','999'"
export NL_EMISS_CHEMI_VARIABLES="'E_CO',     'KIND_E_CO',     'TYPE_E_CO',     'UPDATE','999',
          'E_NO'        ,'KIND_E_NO',           'TYPE_E_NO',  'UPDATE','999'"
export NL_EMISS_FIRECHEMI_VARIABLES="'ebu_in_co'   ,'KIND_EBU_CO',         'TYPE_EBU_CO',  'UPDATE','999',
          'ebu_in_no'    ,'KIND_EBU_NO',         'TYPE_EBU_NO',   'UPDATE','999',
          'ebu_in_oc'    ,'KIND_EBU_OC',         'TYPE_EBU_OC',   'UPDATE','999',
          'ebu_in_bc'    ,'KIND_EBU_BC',         'TYPE_EBU_BC',   'UPDATE','999',
          'ebu_in_c2h4'  ,'KIND_EBU_c2h4',       'TYPE_EBU_c2h4', 'UPDATE','999',
          'ebu_in_ch2o'  ,'KIND_EBU_ch2o',       'TYPE_EBU_ch2o', 'UPDATE','999',
          'ebu_in_ch3oh' ,'KIND_EBU_ch3oh',      'TYPE_EBU_ch3oh','UPDATE','999'"
export NL_WRF_STATE_BOUNDS="'QVAPOR','0.0','NULL','CLAMP',
          'QRAIN', '0.0','NULL','CLAMP',
          'QCLOUD','0.0','NULL','CLAMP',
          'QSNOW', '0.0','NULL','CLAMP',
          'QICE',  '0.0','NULL','CLAMP',
          'o3',    '${O3_MIN}','${O3_MAX}','CLAMP',
          'co',    '${CO_MIN}','${CO_MAX}','CLAMP',
          'no',    '0.0','NULL','CLAMP',
          'no2',   '0.0','NULL','CLAMP',
          'hno3',  '0.0','NULL','CLAMP',
          'hno4',  '0.0','NULL','CLAMP',
          'n2o5',  '0.0','NULL','CLAMP',
          'c2h6',  '0.0','NULL','CLAMP',
          'acet'   '0.0','NULL','CLAMP',
          'hcho'   '0.0','NULL','CLAMP',
          'c2h4',  '0.0','NULL','CLAMP',
          'c3h6',  '0.0','NULL','CLAMP',
          'tol',   '0.0','NULL','CLAMP',
          'mvk',   '0.0','NULL','CLAMP',
          'bigalk','0.0','NULL','CLAMP',
          'isopr', '0.0','NULL','CLAMP',
          'macr',  '0.0','NULL','CLAMP',
          'c3h8'  ,'0.0','NULL','CLAMP',    
          'c10h16','0.0','NULL','CLAMP',
          'DUST_1','0.0','NULL','CLAMP',
          'DUST_2','0.0','NULL','CLAMP',
          'DUST_3','0.0','NULL','CLAMP',
          'DUST_4','0.0','NULL','CLAMP',
          'DUST_5','0.0','NULL','CLAMP',
          'BC1','0.0','NULL','CLAMP',
          'BC2','0.0','NULL','CLAMP',
          'OC1','0.0','NULL','CLAMP',
          'OC2','0.0','NULL','CLAMP',
          'sulf','0.0','NULL','CLAMP',
          'TAUAER1','0.0','NULL','CLAMP',
          'TAUAER2','0.0','NULL','CLAMP',
          'TAUAER3','0.0','NULL','CLAMP',
          'TAUAER4','0.0','NULL','CLAMP',
          'PM10','0.0','NULL','CLAMP',
          'PM2_5_DRY','0.0','NULL','CLAMP',
          'P10','0.0','NULL','CLAMP',
          'P25','0.0','NULL','CLAMP',
          'SEAS_1','0.0','NULL','CLAMP',
          'SEAS_2','0.0','NULL','CLAMP',
          'SEAS_3','0.0','NULL','CLAMP',
          'SEAS_4','0.0','NULL','CLAMP',
          'E_CO','0.0','NULL','CLAMP',
          'E_NO','0.0','NULL','CLAMP',
          'ebu_in_co','0.0','NULL','CLAMP',
          'ebu_in_no','0.0','NULL','CLAMP',
          'ebu_in_oc','0.0','NULL','CLAMP',
          'ebu_in_bc','0.0','NULL','CLAMP',
          'ebu_in_c2h4','0.0','NULL','CLAMP',
          'ebu_in_ch2o','0.0','NULL','CLAMP',
          'ebu_in_ch3oh','0.0','NULL','CLAMP'"
export NL_OUTPUT_STATE_VECTOR=.false.
export NL_NUM_DOMAINS=${CR_DOMAIN}
export NL_CALENDAR_TYPE=3
export NL_ASSIMILATION_PERIOD_SECONDS=${CYCLE_PERIOD_SEC}
# height
#export NL_VERT_LOCALIZATION_COORD=3
# scale height
export NL_VERT_LOCALIZATION_COORD=4
export NL_CENTER_SEARCH_HALF_LENGTH=500000.
export NL_CENTER_SPLINE_GRID_SCALE=10
export NL_SFC_ELEV_MAX_DIFF=100.0
export NL_CIRCULATION_PRES_LEVEL=80000.0
export NL_CIRCULATION_RADIUS=108000.0
export NL_ALLOW_OBS_BELOW_VOL=.false.
#
# &obs_diag_nml
export NL_FIRST_BIN_CENTER_YY=${DT_YYYY}
export NL_FIRST_BIN_CENTER_MM=${DT_MM}
export NL_FIRST_BIN_CENTER_DD=${DT_DD}
export NL_FIRST_BIN_CENTER_HH=${DT_HH}
export NL_LAST_BIN_CENTER_YY=${DT_YYYY}
export NL_LAST_BIN_CENTER_MM=${DT_MM}
export NL_LAST_BIN_CENTER_DD=${DT_DD}
export NL_LAST_BIN_CENTER_HH=${DT_HH}
export NL_BIN_SEPERATION_YY=0
export NL_BIN_SEPERATION_MM=0
export NL_BIN_SEPERATION_DD=0
export NL_BIN_SEPERATION_HH=0
export NL_BIN_WIDTH_YY=0
export NL_BIN_WIDTH_MM=0
export NL_BIN_WIDTH_DD=0
export NL_BIN_WIDTH_HH=0
#
# &restart_file_utility_nml
export NL_SINGLE_RESTART_FILE_IN=.false.       
export NL_SINGLE_RESTART_FILE_OUT=.false.       
#
# &dart_to_wrf_nml
export NL_MODEL_ADVANCE_FILE=.false.
export NL_ADV_MOD_COMMAND="'mpirun -np 64 ./wrf.exe'"
export NL_DART_RESTART_NAME="'dart_wrf_vector'"
export NL_ADD_EMISS=${ADD_EMISS}
#
# &wrf_to_dart_nml
export NL_ADD_EMISS=${ADD_EMISS}
#
# &restart_file_tool_nml
export NL_INPUT_FILE_NAME="'assim_model_state_tp'"
export NL_OUTPUT_FILE_NAME="'assim_model_state_ic'"
export NL_OUTPUT_IS_MODEL_ADVANCE_FILE=.true.
export NL_OVERWRITE_ADVANCE_TIME=.true.
export NL_NEW_ADVANCE_DAYS=${NEXT_DAY_GREG}
export NL_NEW_ADVANCE_SECS=${NEXT_SEC_GREG}
#
# &preprocess_nml
export NL_INPUT_OBS_KIND_MOD_FILE=\'${DART_DIR}/obs_kind/DEFAULT_obs_kind_mod.F90\'
export NL_OUTPUT_OBS_KIND_MOD_FILE=\'${DART_DIR}/obs_kind/obs_kind_mod.f90\'
export NL_INPUT_OBS_DEF_MOD_FILE=\'${DART_DIR}/obs_kind/DEFAULT_obs_def_mod.F90\'
export NL_OUTPUT_OBS_DEF_MOD_FILE=\'${DART_DIR}/obs_kind/obs_def_mod.f90\'
export NL_INPUT_FILES="'${DART_DIR}/obs_def/obs_def_reanalysis_bufr_mod.f90',
                    '${DART_DIR}/obs_def/obs_def_radar_mod.f90',
                    '${DART_DIR}/obs_def/obs_def_metar_mod.f90',
                    '${DART_DIR}/obs_def/obs_def_dew_point_mod.f90',
                    '${DART_DIR}/obs_def/obs_def_altimeter_mod.f90',
                    '${DART_DIR}/obs_def/obs_def_gps_mod.f90',
                    '${DART_DIR}/obs_def/obs_def_gts_mod.f90',
                    '${DART_DIR}/obs_def/obs_def_vortex_mod.f90',
                    '${DART_DIR}/obs_def/obs_def_AIRNOW_OBS_mod.f90',
                    '${DART_DIR}/obs_def/obs_def_TOLNET_OBS_mod.f90',
                    '${DART_DIR}/obs_def/obs_def_PANDA_OBS_mod.f90',
                    '${DART_DIR}/obs_def/obs_def_IASI_CO_mod.f90',
                    '${DART_DIR}/obs_def/obs_def_IASI_O3_mod.f90',
                    '${DART_DIR}/obs_def/obs_def_OMI_NO2_mod.f90',
                    '${DART_DIR}/obs_def/obs_def_MOPITT_CO_mod.f90',
                    '${DART_DIR}/obs_def/obs_def_MODIS_AOD_mod.f90'"
#
# &obs_kind_nml
export NL_ASSIMILATE_THESE_OBS_TYPES="'AIRNOW_O3', 
                                      'TOLNET_O3',
                                      'MOPITT_CO_RETRIEVAL',
                                      'IASI_CO_RETRIEVAL',
                                      'IASI_O3_RETRIEVAL',
                                      'MODIS_AOD_RETRIEVAL',
                                      'OMI_NO2_COLUMN'"
#                                   "'RADIOSONDE_TEMPERATURE',
#                                   'RADIOSONDE_U_WIND_COMPONENT',
#                                   'RADIOSONDE_V_WIND_COMPONENT',
#                                   'RADIOSONDE_SPECIFIC_HUMIDITY',
#                                   'ACARS_U_WIND_COMPONENT',
#                                   'ACARS_V_WIND_COMPONENT',
#                                   'ACARS_TEMPERATURE',
#                                   'AIRCRAFT_U_WIND_COMPONENT',
#                                   'AIRCRAFT_V_WIND_COMPONENT',
#                                   'AIRCRAFT_TEMPERATURE',
#                                   'SAT_U_WIND_COMPONENT',
#                                   'SAT_V_WIND_COMPONENT',
#                                   'MOPITT_CO_RETRIEVAL',
#                                   'AIRNOW_O3',
#                                   'TOLNET_O3'"
#                                  'PANDA_CO',
#                                  'PANDA_O3',
#                                  'PANDA_PM25'"
#                                   'AIRNOW_CO'"
#                                   'IASI_CO_RETRIEVAL',
#                                   'IASI_O3_RETRIEVAL',
#                                   'MODIS_AOD_RETRIEVAL',
#                                   'OMI_NO2_COLUMN'"
export NL_EVALUATE_THESE_OBS_TYPES=' '
#export NL_EVALUATE_THESE_OBS_TYPES="'MOPITT_CO_RETRIEVAL',
#                                    'IASI_CO_RETRIEVAL',
#                                    'AIRNOW_CO',
#                                    'AIRNOW_O3',
#                                    'MODIS_AOD_RETRIEVAL'"
#
# &replace_wrf_fields_nml
export NL_FIELDNAMES="'SNOWC',
                   'ALBBCK',
                   'TMN',
                   'TSK',
                   'SH2O',
                   'SMOIS',
                   'SEAICE',
                   'HGT_d01',
                   'TSLB',
                   'SST',
                   'SNOWH',
                   'SNOW'"
export NL_FIELDLIST_FILE="' '"
#
# &location_nml
export NL_HORIZ_DIST_ONLY=.false.
export NL_VERT_NORMALIZATION_PRESSURE=100000.0
export NL_VERT_NORMALIZATION_HEIGHT=10000.0
export NL_VERT_NORMALIZATION_LEVELS=20.0
export NL_VERT_NORMALIZATION_SCALE_HEIGHT=1.5
export NL_SPECIAL_VERT_NORMALIZATION_OBS_TYPES="'IASI_CO_RETRIEVAL','MOPITT_CO_RETRIEVAL'"
export NL_SPECIAL_VERT_NORMALIZATION_PRESSURES="100000.0,100000.0"
export NL_SPECIAL_VERT_NORMALIZATION_HEIGHTS="10000.0,10000.0"
export NL_SPECIAL_VERT_NORMALIZATION_LEVELS="20.0,20.0"
export NL_SPECIAL_VERT_NORMALIZATION_SCALE_HEIGHTS="1.5,1.5"
#
# ASSIMILATION WINDOW PARAMETERS
export ASIM_DATE_MIN=$(${BUILD_DIR}/da_advance_time.exe ${DATE} -${ASIM_WINDOW} 2>/dev/null)
export ASIM_DATE_MAX=$(${BUILD_DIR}/da_advance_time.exe ${DATE} +${ASIM_WINDOW} 2>/dev/null)
export ASIM_MN_YYYY=$(echo $ASIM_DATE_MIN | cut -c1-4)
export ASIM_MN_MM=$(echo $ASIM_DATE_MIN | cut -c5-6)
export ASIM_MN_DD=$(echo $ASIM_DATE_MIN | cut -c7-8)
export ASIM_MN_HH=$(echo $ASIM_DATE_MIN | cut -c9-10)
#
export ASIM_MX_YYYY=$(echo $ASIM_DATE_MAX | cut -c1-4)
export ASIM_MX_MM=$(echo $ASIM_DATE_MAX | cut -c5-6)
export ASIM_MX_DD=$(echo $ASIM_DATE_MAX | cut -c7-8)
export ASIM_MX_HH=$(echo $ASIM_DATE_MAX | cut -c9-10)
#
# WRFCHEM FIRE PARAMETERS:
export FIRE_START_DATE=${YYYY}-${MM}-${DD}
export E_DATE=$(${BUILD_DIR}/da_advance_time.exe ${DATE} ${FCST_PERIOD} 2>/dev/null)
export E_YYYY=$(echo $E_DATE | cut -c1-4)
export E_MM=$(echo $E_DATE | cut -c5-6)
export E_DD=$(echo $E_DATE | cut -c7-8)
export E_HH=$(echo $E_DATE | cut -c9-10)
export FIRE_END_DATE=${E_YYYY}-${E_MM}-${E_DD}
#
#########################################################################
#
# RUN REAL
#
#########################################################################
#
if [[ ${RUN_REAL} = "true" ]]; then 
   mkdir -p ${RUN_DIR}/${DATE}/real
   cd ${RUN_DIR}/${DATE}/real
#
   cp ${WRF_DIR}/main/real.exe ./.
   cp ${EXPERIMENT_HIST_IO_DIR}/hist_io_flds_v1 ./.
   cp ${EXPERIMENT_HIST_IO_DIR}/hist_io_flds_v2 ./.
   cp ${EXPERIMENT_HIST_IO_DIR}/hist_io_flds_v3 ./.
#
# LINK IN THE METGRID FILES
   export P_DATE=${DATE}
   (( FCST_PERIOD_TWICE=2*${FCST_PERIOD} ))
   export P_END_DATE=$(${BUILD_DIR}/da_advance_time.exe ${P_DATE} ${FCST_PERIOD_TWICE} 2>/dev/null)
   while [[ ${P_DATE} -le ${P_END_DATE} ]] ; do
      export P_YYYY=$(echo $P_DATE | cut -c1-4)
      export P_MM=$(echo $P_DATE | cut -c5-6)
      export P_DD=$(echo $P_DATE | cut -c7-8)
      export P_HH=$(echo $P_DATE | cut -c9-10)
      export P_FILE_DATE=${P_YYYY}-${P_MM}-${P_DD}_${P_HH}:00:00.nc
      ln -sf ${RUN_DIR}/metgrid/met_em.d${CR_DOMAIN}.${P_FILE_DATE} ./.
      ln -sf ${RUN_DIR}/metgrid/met_em.d${MR_DOMAIN}.${P_FILE_DATE} ./.
      ln -sf ${RUN_DIR}/metgrid/met_em.d${FR_DOMAIN}.${P_FILE_DATE} ./.
      export P_DATE=$(${BUILD_DIR}/da_advance_time.exe ${P_DATE} ${MET_INTERVAL_HR} 2>/dev/null) 
   done
#
# LOOP THROUGH BDY TENDENCY TIMES FOR PERTURB_BC
   export P_DATE=${DATE}
   export P_END_DATE=$(${BUILD_DIR}/da_advance_time.exe ${P_DATE} ${FCST_PERIOD} 2>/dev/null)
   while [[ ${P_DATE} -le ${P_END_DATE} ]] ; do      
#
# CREATE WRF NAMELIST
      export NL_IOFIELDS_FILENAME=' '
      export NL_IOFIELDS_FILENAME=\'hist_io_flds_v1\',\'hist_io_flds_v2\',\'hist_io_flds_v3\'
      export L_FCST_RANGE=${MET_INTERVAL_HR}
      export NL_DX=${DX_CR},${DX_MR},${DX_FR}
      export NL_DY=${DX_CR},${DX_MR},${DX_FR}
      export L_START_DATE=${P_DATE}
      export L_END_DATE=$($BUILD_DIR/da_advance_time.exe ${L_START_DATE} ${FCST_PERIOD} 2>/dev/null)
      export L_START_YEAR=$(echo $L_START_DATE | cut -c1-4)
      export L_START_MONTH=$(echo $L_START_DATE | cut -c5-6)
      export L_START_DAY=$(echo $L_START_DATE | cut -c7-8)
      export L_START_HOUR=$(echo $L_START_DATE | cut -c9-10)
      export L_END_YEAR=$(echo $L_END_DATE | cut -c1-4)
      export L_END_MONTH=$(echo $L_END_DATE | cut -c5-6)
      export L_END_DAY=$(echo $L_END_DATE | cut -c7-8)
      export L_END_HOUR=$(echo $L_END_DATE | cut -c9-10)
      export NL_START_YEAR=$(echo $L_START_DATE | cut -c1-4),$(echo $L_START_DATE | cut -c1-4),$(echo $L_START_DATE | cut -c1-4)
      export NL_START_MONTH=$(echo $L_START_DATE | cut -c5-6),$(echo $L_START_DATE | cut -c5-6),$(echo $L_START_DATE | cut -c5-6)
      export NL_START_DAY=$(echo $L_START_DATE | cut -c7-8),$(echo $L_START_DATE | cut -c7-8),$(echo $L_START_DATE | cut -c7-8)
      export NL_START_HOUR=$(echo $L_START_DATE | cut -c9-10),$(echo $L_START_DATE | cut -c9-10),$(echo $L_START_DATE | cut -c9-10)
      export NL_END_YEAR=$(echo $L_END_DATE | cut -c1-4),$(echo $L_END_DATE | cut -c1-4),$(echo $L_END_DATE | cut -c1-4)
      export NL_END_MONTH=$(echo $L_END_DATE | cut -c5-6),$(echo $L_END_DATE | cut -c5-6),$(echo $L_END_DATE | cut -c5-6)
      export NL_END_DAY=$(echo $L_END_DATE | cut -c7-8),$(echo $L_END_DATE | cut -c7-8),$(echo $L_END_DATE | cut -c7-8)
      export NL_END_HOUR=$(echo $L_END_DATE | cut -c9-10),$(echo $L_END_DATE | cut -c9-10),$(echo $L_END_DATE | cut -c9-10)
      export NL_START_DATE=\'${L_START_YEAR}-${L_START_MONTH}-${L_START_DAY}_${L_START_HOUR}:00:00\',\'${L_START_YEAR}-${L_START_MONTH}-${L_START_DAY}_${L_START_HOUR}:00:00\',\'${L_START_YEAR}-${L_START_MONTH}-${L_START_DAY}_${L_START_HOUR}:00:00\'
      export NL_END_DATE=\'${L_END_YEAR}-${L_END_MONTH}-${L_END_DAY}_${L_END_HOUR}:00:00\',\'${L_END_YEAR}-${L_END_MONTH}-${L_END_DAY}_${L_END_HOUR}:00:00\',\'${L_END_YEAR}-${L_END_MONTH}-${L_END_DAY}_${L_END_HOUR}:00:00\'
      ${HYBRID_SCRIPTS_DIR}/da_create_wrfchem_namelist_nested_RT.ksh
#
      RANDOM=$$
      export JOBRND=${RANDOM}_real
       ${HYBRID_SCRIPTS_DIR}/job_script_taki.ksh ${JOBRND} ${GENERAL_JOB_CLASS} ${GENERAL_TIME_LIMIT} ${GENERAL_NODES} ${GENERAL_TASKS} real.exe PARALLEL
       sbatch -W job.ksh
#      mpirun real.exe
#
      mv wrfinput_d${CR_DOMAIN} wrfinput_d${CR_DOMAIN}_$(${BUILD_DIR}/da_advance_time.exe ${P_DATE} 0 -W 2>/dev/null)
      mv wrfinput_d${MR_DOMAIN} wrfinput_d${MR_DOMAIN}_$(${BUILD_DIR}/da_advance_time.exe ${P_DATE} 0 -W 2>/dev/null)
      mv wrfinput_d${FR_DOMAIN} wrfinput_d${FR_DOMAIN}_$(${BUILD_DIR}/da_advance_time.exe ${P_DATE} 0 -W 2>/dev/null)
      mv wrfbdy_d${CR_DOMAIN} wrfbdy_d${CR_DOMAIN}_$(${BUILD_DIR}/da_advance_time.exe ${P_DATE} 0 -W 2>/dev/null)
#      mv wrfbdy_d${FR_DOMAIN} wrfbdy_d${FR_DOMAIN}_$(${BUILD_DIR}/da_advance_time.exe ${P_DATE} 0 -W 2>/dev/null)
      export P_DATE=$(${BUILD_DIR}/da_advance_time.exe ${P_DATE} ${MET_INTERVAL_HR} 2>/dev/null) 
   done
fi
#
#########################################################################
#
# RUN INTERPOLATION TO GET MISSING BACKGROUND DATA
#
#########################################################################
#
if [[ ${RUN_INTERPOLATE} = "true" ]]; then 
   if [[ ! -d ${RUN_DIR}/${DATE}/metgrid ]]; then
      mkdir -p ${RUN_DIR}/${DATE}/metgrid
   fi
   if [[ ! -d ${RUN_DIR}/${DATE}/real ]]; then
      mkdir -p ${RUN_DIR}/${DATE}/real
   fi
#
# GET METGRID DATA
   cd ${RUN_DIR}/${DATE}/metgrid
   rm -rf met_em.d*
#
# LINK IN THE BACK AND FORW METGRID FILES
   export P_DATE=${BACK_DATE}
   export P_END_DATE=$(${BUILD_DIR}/da_advance_time.exe ${P_DATE} ${LBC_END} 2>/dev/null)
   while [[ ${P_DATE} -le ${P_END_DATE} ]] ; do
      export P_YYYY=$(echo $P_DATE | cut -c1-4)
      export P_MM=$(echo $P_DATE | cut -c5-6)
      export P_DD=$(echo $P_DATE | cut -c7-8)
      export P_HH=$(echo $P_DATE | cut -c9-10)
      export P_FILE_DATE=${P_YYYY}-${P_MM}-${P_DD}_${P_HH}:00:00.nc
      ln -sf ${RUN_DIR}/${BACK_DATE}/metgrid/met_em.d${CR_DOMAIN}.${P_FILE_DATE} ./BK_met_em.d${CR_DOMAIN}.${P_FILE_DATE}
      ln -sf ${RUN_DIR}/${BACK_DATE}/metgrid/met_em.d${MR_DOMAIN}.${P_FILE_DATE} ./BK_met_em.d${MR_DOMAIN}.${P_FILE_DATE}
      ln -sf ${RUN_DIR}/${BACK_DATE}/metgrid/met_em.d${FR_DOMAIN}.${P_FILE_DATE} ./BK_met_em.d${FR_DOMAIN}.${P_FILE_DATE}
      export P_DATE=$(${BUILD_DIR}/da_advance_time.exe ${P_DATE} ${FCST_PERIOD} 2>/dev/null) 
   done
   export P_DATE=${FORW_DATE}
   export P_END_DATE=$(${BUILD_DIR}/da_advance_time.exe ${P_DATE} ${LBC_END} 2>/dev/null)
   while [[ ${P_DATE} -le ${P_END_DATE} ]] ; do
      export P_YYYY=$(echo $P_DATE | cut -c1-4)
      export P_MM=$(echo $P_DATE | cut -c5-6)
      export P_DD=$(echo $P_DATE | cut -c7-8)
      export P_HH=$(echo $P_DATE | cut -c9-10)
      export P_FILE_DATE=${P_YYYY}-${P_MM}-${P_DD}_${P_HH}:00:00.nc
      ln -sf ${RUN_DIR}/${FORW_DATE}/metgrid/met_em.d${CR_DOMAIN}.${P_FILE_DATE} ./FW_met_em.d${CR_DOMAIN}.${P_FILE_DATE}
      ln -sf ${RUN_DIR}/${FORW_DATE}/metgrid/met_em.d${MR_DOMAIN}.${P_FILE_DATE} ./FW_met_em.d${MR_DOMAIN}.${P_FILE_DATE}
      ln -sf ${RUN_DIR}/${FORW_DATE}/metgrid/met_em.d${FR_DOMAIN}.${P_FILE_DATE} ./FW_met_em.d${FR_DOMAIN}.${P_FILE_DATE}
      export P_DATE=$(${BUILD_DIR}/da_advance_time.exe ${P_DATE} ${FCST_PERIOD} 2>/dev/null) 
   done
#
# DO INTERPOLATION
   export P_DATE=${DATE}
   export P_BACK_DATE=${BACK_DATE}
   export P_FORW_DATE=${FORW_DATE}
   export P_END_DATE=$(${BUILD_DIR}/da_advance_time.exe ${P_DATE} ${LBC_END} 2>/dev/null)
   while [[ ${P_DATE} -le ${P_END_DATE} ]] ; do
      export P_YYYY=$(echo $P_DATE | cut -c1-4)
      export P_MM=$(echo $P_DATE | cut -c5-6)
      export P_DD=$(echo $P_DATE | cut -c7-8)
      export P_HH=$(echo $P_DATE | cut -c9-10)
      export P_FILE_DATE=${P_YYYY}-${P_MM}-${P_DD}_${P_HH}:00:00
      export P_BK_YYYY=$(echo $P_BACK_DATE | cut -c1-4)
      export P_BK_MM=$(echo $P_BACK_DATE | cut -c5-6)
      export P_BK_DD=$(echo $P_BACK_DATE | cut -c7-8)
      export P_BK_HH=$(echo $P_BACK_DATE | cut -c9-10)
      export P_BACK_FILE_DATE=${P_BK_YYYY}-${P_BK_MM}-${P_BK_DD}_${P_BK_HH}:00:00
      export P_FW_YYYY=$(echo $P_FORW_DATE | cut -c1-4)
      export P_FW_MM=$(echo $P_FORW_DATE | cut -c5-6)
      export P_FW_DD=$(echo $P_FORW_DATE | cut -c7-8)
      export P_FW_HH=$(echo $P_FORW_DATE | cut -c9-10)
      export P_FORW_FILE_DATE=${P_FW_YYYY}-${P_FW_MM}-${P_FW_DD}_${P_FW_HH}:00:00
      export BACK_FILE_CR=BK_met_em.d${CR_DOMAIN}.${P_BACK_FILE_DATE}.nc
      export BACK_FILE_FR=BK_met_em.d${FR_DOMAIN}.${P_BACK_FILE_DATE}.nc
      export FORW_FILE_CR=FW_met_em.d${CR_DOMAIN}.${P_FORW_FILE_DATE}.nc
      export FORW_FILE_FR=FW_met_em.d${FR_DOMAIN}.${P_FORW_FILE_DATE}.nc
      export OUTFILE_CR=met_em.d${CR_DOMAIN}.${P_FILE_DATE}.nc
      export OUTFILE_FR=met_em.d${FR_DOMAIN}.${P_FILE_DATE}.nc
      export TIME_INTERP_DIR1=${DART_DIR}/models/wrf_chem
      export TIME_INTERP_DIR2=run_scripts/RUN_TIME_INTERP
      export FIX_TIME_FILE=${TIME_INTERP_DIR1}/${TIME_INTERP_DIR2}/fix_time_stamp.exe
      export NUM_FIX_DATES=1
      cp ${FIX_TIME_FILE} ./.
#
# CREATE NAMELIST
      rm -rf time_stamp_nml.nl
      cat << EOF > time_stamp_nml.nl
&time_stamp_nml
time_str1='${P_FILE_DATE}'
file_str='${OUTFILE_CR}'
num_dates=${NUM_FIX_DATES}
file_sw=0
/
EOF
      ncflint -w ${BACK_WT} ${BACK_FILE_CR} ${FORW_FILE_CR} ${OUTFILE_CR}
      ./fix_time_stamp.exe
#
# CREATE NAMELIST
      rm -rf time_stamp_nml.nl
      cat << EOF > time_stamp_nml.nl
&time_stamp_nml
time_str1='${P_FILE_DATE}'
file_str='${OUTFILE_MR}'
num_dates=${NUM_FIX_DATES}
file_sw=0
/
EOF
      ncflint -w ${BACK_WT} ${BACK_FILE_MR} ${FORW_FILE_MR} ${OUTFILE_MR}
      ./fix_time_stamp.exe

#
# CREATE NAMELIST
      rm -rf time_stamp_nml.nl
      cat << EOF > time_stamp_nml.nl
&time_stamp_nml
time_str1='${P_FILE_DATE}'
file_str='${OUTFILE_FR}'
num_dates=${NUM_FIX_DATES}
file_sw=0
/
EOF
      ncflint -w ${BACK_WT} ${BACK_FILE_FR} ${FORW_FILE_FR} ${OUTFILE_FR}
      ./fix_time_stamp.exe
      export P_BACK_DATE=$(${BUILD_DIR}/da_advance_time.exe ${P_BACK_DATE} ${FCST_PERIOD} 2>/dev/null) 
      export P_FORW_DATE=$(${BUILD_DIR}/da_advance_time.exe ${P_FORW_DATE} ${FCST_PERIOD} 2>/dev/null) 
      export P_DATE=$(${BUILD_DIR}/da_advance_time.exe ${P_DATE} ${FCST_PERIOD} 2>/dev/null) 
   done
#
# GET REAL DATA
   cd ${RUN_DIR}/${DATE}/real
   rm -rf wrfbdy_d*
   rm -rf wrfinput_d*
#
# LINK IN THE BACK AND FORW WRFBDY AND WRFINPUT FILES
   export P_DATE=${BACK_DATE}
   export P_END_DATE=$(${BUILD_DIR}/da_advance_time.exe ${P_DATE} ${FCST_PERIOD} 2>/dev/null)
   while [[ ${P_DATE} -le ${P_END_DATE} ]] ; do
      export P_YYYY=$(echo $P_DATE | cut -c1-4)
      export P_MM=$(echo $P_DATE | cut -c5-6)
      export P_DD=$(echo $P_DATE | cut -c7-8)
      export P_HH=$(echo $P_DATE | cut -c9-10)
      export P_FILE_DATE=${P_YYYY}-${P_MM}-${P_DD}_${P_HH}:00:00
      ln -sf ${RUN_DIR}/${BACK_DATE}/real/wrfbdy_d${CR_DOMAIN}_${P_FILE_DATE} ./BK_wrfbdy_d${CR_DOMAIN}_${P_FILE_DATE}
      ln -sf ${RUN_DIR}/${BACK_DATE}/real/wrfinput_d${CR_DOMAIN}_${P_FILE_DATE} ./BK_wrfinput_d${CR_DOMAIN}_${P_FILE_DATE}
      ln -sf ${RUN_DIR}/${BACK_DATE}/real/wrfinput_d${MR_DOMAIN}_${P_FILE_DATE} ./BK_wrfinput_d${MR_DOMAIN}_${P_FILE_DATE}
      ln -sf ${RUN_DIR}/${BACK_DATE}/real/wrfinput_d${FR_DOMAIN}_${P_FILE_DATE} ./BK_wrfinput_d${FR_DOMAIN}_${P_FILE_DATE}
      export P_DATE=$(${BUILD_DIR}/da_advance_time.exe ${P_DATE} ${FCST_PERIOD} 2>/dev/null) 
   done
   export P_DATE=${FORW_DATE}
   export P_END_DATE=$(${BUILD_DIR}/da_advance_time.exe ${P_DATE} ${FCST_PERIOD} 2>/dev/null)
   while [[ ${P_DATE} -le ${P_END_DATE} ]] ; do
      export P_YYYY=$(echo $P_DATE | cut -c1-4)
      export P_MM=$(echo $P_DATE | cut -c5-6)
      export P_DD=$(echo $P_DATE | cut -c7-8)
      export P_HH=$(echo $P_DATE | cut -c9-10)
      export P_FILE_DATE=${P_YYYY}-${P_MM}-${P_DD}_${P_HH}:00:00
      ln -sf ${RUN_DIR}/${FORW_DATE}/real/wrfbdy_d${CR_DOMAIN}_${P_FILE_DATE} ./FW_wrfbdy_d${CR_DOMAIN}_${P_FILE_DATE}
      ln -sf ${RUN_DIR}/${FORW_DATE}/real/wrfinput_d${CR_DOMAIN}_${P_FILE_DATE} ./FW_wrfinput_d${CR_DOMAIN}_${P_FILE_DATE}
      ln -sf ${RUN_DIR}/${FORW_DATE}/real/wrfinput_d${MR_DOMAIN}_${P_FILE_DATE} ./FW_wrfinput_d${MR_DOMAIN}_${P_FILE_DATE}
      ln -sf ${RUN_DIR}/${FORW_DATE}/real/wrfinput_d${FR_DOMAIN}_${P_FILE_DATE} ./FW_wrfinput_d${FR_DOMAIN}_${P_FILE_DATE}
      export P_DATE=$(${BUILD_DIR}/da_advance_time.exe ${P_DATE} ${FCST_PERIOD} 2>/dev/null) 
   done
#
# DO INTERPOLATION
   export P_DATE=${DATE}
   export P_BACK_DATE=${BACK_DATE}
   export P_FORW_DATE=${FORW_DATE}
   export P_END_DATE=$(${BUILD_DIR}/da_advance_time.exe ${P_DATE} ${FCST_PERIOD} 2>/dev/null)
   while [[ ${P_DATE} -le ${P_END_DATE} ]] ; do
      export P_YYYY=$(echo $P_DATE | cut -c1-4)
      export P_MM=$(echo $P_DATE | cut -c5-6)
      export P_DD=$(echo $P_DATE | cut -c7-8)
      export P_HH=$(echo $P_DATE | cut -c9-10)
      export P_FILE_DATE=${P_YYYY}-${P_MM}-${P_DD}_${P_HH}:00:00
      export P_BK_YYYY=$(echo $P_BACK_DATE | cut -c1-4)
      export P_BK_MM=$(echo $P_BACK_DATE | cut -c5-6)
      export P_BK_DD=$(echo $P_BACK_DATE | cut -c7-8)
      export P_BK_HH=$(echo $P_BACK_DATE | cut -c9-10)
      export P_BACK_FILE_DATE=${P_BK_YYYY}-${P_BK_MM}-${P_BK_DD}_${P_BK_HH}:00:00
      export P_FW_YYYY=$(echo $P_FORW_DATE | cut -c1-4)
      export P_FW_MM=$(echo $P_FORW_DATE | cut -c5-6)
      export P_FW_DD=$(echo $P_FORW_DATE | cut -c7-8)
      export P_FW_HH=$(echo $P_FORW_DATE | cut -c9-10)
      export P_FORW_FILE_DATE=${P_FW_YYYY}-${P_FW_MM}-${P_FW_DD}_${P_FW_HH}:00:00
      export BACK_BDYF_CR=BK_wrfbdy_d${CR_DOMAIN}_${P_BACK_FILE_DATE}
      export BACK_FILE_CR=BK_wrfinput_d${CR_DOMAIN}_${P_BACK_FILE_DATE}
      export BACK_FILE_FR=BK_wrfinput_d${FR_DOMAIN}_${P_BACK_FILE_DATE}
      export FORW_BDYF_CR=FW_wrfbdy_d${CR_DOMAIN}_${P_FORW_FILE_DATE}
      export FORW_FILE_CR=FW_wrfinput_d${CR_DOMAIN}_${P_FORW_FILE_DATE}
      export FORW_FILE_FR=FW_wrfinput_d${FR_DOMAIN}_${P_FORW_FILE_DATE}
      export BDYFILE_CR=wrfbdy_d${CR_DOMAIN}_${P_FILE_DATE}
      export OUTFILE_CR=wrfinput_d${CR_DOMAIN}_${P_FILE_DATE}
      export OUTFILE_FR=wrfinput_d${FR_DOMAIN}_${P_FILE_DATE}
      export TIME_INTERP_DIR1=${DART_DIR}/models/wrf_chem
      export TIME_INTERP_DIR2=run_scripts/RUN_TIME_INTERP
      export FIX_TIME_FILE=${TIME_INTERP_DIR1}/${TIME_INTERP_DIR2}/fix_time_stamp.exe
      let NUM_FIX_DATES=${FCST_PERIOD}/${FCST_PERIOD}
      ((FX_IDX=0)) 
      export STR_FXDT=${P_DATE}
      export END_FXDT=$(${BUILD_DIR}/da_advance_time.exe ${STR_FXDT} ${FCST_PERIOD} 2>/dev/null)
      while [[ ${STR_FXDT} -le ${END_FXDT} ]] ; do
         export FX_YYYY=$(echo $STR_FXDT | cut -c1-4)
         export FX_MM=$(echo $STR_FXDT | cut -c5-6)
         export FX_DD=$(echo $STR_FXDT | cut -c7-8)
         export FX_HH=$(echo $STR_FXDT | cut -c9-10)
         export FX_FILE_DATE[${FX_IDX}]=${FX_YYYY}-${FX_MM}-${FX_DD}_${FX_HH}:00:00
         let FX_IDX=${FX_IDX}+1
         export STR_FXDT=$(${BUILD_DIR}/da_advance_time.exe ${STR_FXDT} ${FCST_PERIOD} 2>/dev/null)
      done
      ((FX_IDX=0)) 
      export STR_FXDT=$(${BUILD_DIR}/da_advance_time.exe ${P_DATE} ${FCST_PERIOD} 2>/dev/null)
      export END_FXDT=$(${BUILD_DIR}/da_advance_time.exe ${STR_FXDT} ${FCST_PERIOD} 2>/dev/null)
      while [[ ${STR_FXDT} -le ${END_FXDT} ]] ; do
         export FX_YYYY=$(echo $STR_FXDT | cut -c1-4)
         export FX_MM=$(echo $STR_FXDT | cut -c5-6)
         export FX_DD=$(echo $STR_FXDT | cut -c7-8)
         export FX_HH=$(echo $STR_FXDT | cut -c9-10)
         export FX_FILE_NEXT_DATE[${FX_IDX}]=${FX_YYYY}-${FX_MM}-${FX_DD}_${FX_HH}:00:00
         let FX_IDX=${FX_IDX}+1
         export STR_FXDT=$(${BUILD_DIR}/da_advance_time.exe ${STR_FXDT} ${FCST_PERIOD} 2>/dev/null)
      done
      cp ${FIX_TIME_FILE} ./.
#
# CREATE NAMELIST
      rm -rf time_stamp_nml.nl
      cat << EOF > time_stamp_nml.nl
&time_stamp_nml
time_str1='${FX_FILE_DATE[0]}'
time_str2='${FX_FILE_DATE[1]}'
time_this_str1='${FX_FILE_DATE[0]}'
time_this_str2='${FX_FILE_DATE[1]}'
time_next_str1='${FX_FILE_NEXT_DATE[0]}'
time_next_str2='${FX_FILE_NEXT_DATE[1]}'
file_str='${BDYFILE_CR}'
num_dates=${NUM_FIX_DATES}
file_sw=1
/
EOF
      ncflint -w ${BACK_WT} ${BACK_BDYF_CR} ${FORW_BDYF_CR} ${BDYFILE_CR}
      ncflint -w ${BACK_WT} ${BACK_BDYF_MR} ${FORW_BDYF_MR} ${BDYFILE_MR}
      ./fix_time_stamp.exe
      export TIME_INTERP_DIR1=${DART_DIR}/models/wrf_chem
      export TIME_INTERP_DIR2=run_scripts/RUN_TIME_INTERP
      export FIX_TIME_FILE=${TIME_INTERP_DIR1}/${TIME_INTERP_DIR2}/fix_time_stamp.exe
      cp ${FIX_TIME_FILE} ./.
#
# CREATE NAMELIST
      rm -rf time_stamp_nml.nl
      cat << EOF > time_stamp_nml.nl
&time_stamp_nml
time_str1='${FX_FILE_DATE[0]}'
time_str2='${FX_FILE_DATE[1]}'
time_this_str1='${FX_FILE_DATE[0]}'
time_this_str2='${FX_FILE_DATE[1]}'
time_next_str1='${FX_FILE_NEXT_DATE[0]}'
time_next_str2='${FX_FILE_NEXT_DATE[1]}'
file_str='${OUTFILE_CR}'
num_dates=${NUM_FIX_DATES}
file_sw=0
/
EOF
      ncflint -w ${BACK_WT} ${BACK_FILE_CR} ${FORW_FILE_CR} ${OUTFILE_CR}
      ncflint -w ${BACK_WT} ${BACK_FILE_MR} ${FORW_FILE_MR} ${OUTFILE_MR}
      ./fix_time_stamp.exe
      export TIME_INTERP_DIR1=${DART_DIR}/models/wrf_chem
      export TIME_INTERP_DIR2=run_scripts/RUN_TIME_INTERP
      export FIX_TIME_FILE=${TIME_INTERP_DIR1}/${TIME_INTERP_DIR2}/fix_time_stamp.exe
      cp ${FIX_TIME_FILE} ./.
#
# CREATE NAMELIST
      rm -rf time_stamp_nml.nl
      cat << EOF > time_stamp_nml.nl
&time_stamp_nml
time_str1='${FX_FILE_DATE[0]}'
time_str2='${FX_FILE_DATE[1]}'
time_this_str1='${FX_FILE_DATE[0]}'
time_this_str2='${FX_FILE_DATE[1]}'
time_next_str1='${FX_FILE_NEXT_DATE[0]}'
time_next_str2='${FX_FILE_NEXT_DATE[1]}'
file_str='${OUTFILE_FR}'
num_dates=${NUM_FIX_DATES}
file_sw=0
/
EOF
      ncflint -w ${BACK_WT} ${BACK_FILE_FR} ${FORW_FILE_FR} ${OUTFILE_FR}
      ./fix_time_stamp.exe
      export P_BACK_DATE=$(${BUILD_DIR}/da_advance_time.exe ${P_BACK_DATE} ${FCST_PERIOD} 2>/dev/null) 
      export P_FORW_DATE=$(${BUILD_DIR}/da_advance_time.exe ${P_FORW_DATE} ${FCST_PERIOD} 2>/dev/null) 
      export P_DATE=$(${BUILD_DIR}/da_advance_time.exe ${P_DATE} ${FCST_PERIOD} 2>/dev/null) 
   done
fi
#
#########################################################################
#
# RUN PERT_WRFCHEM_MET_IC
#
#########################################################################
#
if [[ ${RUN_PERT_WRFCHEM_MET_IC} = "true" ]]; then 
   if [[ ! -d ${RUN_DIR}/${DATE}/wrfchem_met_ic ]]; then
      mkdir -p ${RUN_DIR}/${DATE}/wrfchem_met_ic
      cd ${RUN_DIR}/${DATE}/wrfchem_met_ic
   else
      cd ${RUN_DIR}/${DATE}/wrfchem_met_ic
   fi
#
   export NL_MAX_DOM=1
   export NL_OB_FORMAT=1
   export L_FCST_RANGE=${FCST_PERIOD}
   export L_START_DATE=${DATE}
   export L_END_DATE=$($BUILD_DIR/da_advance_time.exe ${L_START_DATE} ${L_FCST_RANGE} 2>/dev/null)
   export L_START_YEAR=$(echo $L_START_DATE | cut -c1-4)
   export L_START_MONTH=$(echo $L_START_DATE | cut -c5-6)
   export L_START_DAY=$(echo $L_START_DATE | cut -c7-8)
   export L_START_HOUR=$(echo $L_START_DATE | cut -c9-10)
   export L_END_YEAR=$(echo $L_END_DATE | cut -c1-4)
   export L_END_MONTH=$(echo $L_END_DATE | cut -c5-6)
   export L_END_DAY=$(echo $L_END_DATE | cut -c7-8)
   export L_END_HOUR=$(echo $L_END_DATE | cut -c9-10)
   export NL_START_YEAR=$(echo $L_START_DATE | cut -c1-4),$(echo $L_START_DATE | cut -c1-4),$(echo $L_START_DATE | cut -c1-4)
   export NL_START_MONTH=$(echo $L_START_DATE | cut -c5-6),$(echo $L_START_DATE | cut -c5-6),$(echo $L_START_DATE | cut -c5-6)
   export NL_START_DAY=$(echo $L_START_DATE | cut -c7-8),$(echo $L_START_DATE | cut -c7-8),$(echo $L_START_DATE | cut -c7-8)
   export NL_START_HOUR=$(echo $L_START_DATE | cut -c9-10),$(echo $L_START_DATE | cut -c9-10),$(echo $L_START_DATE | cut -c9-10)
   export NL_END_YEAR=$(echo $L_END_DATE | cut -c1-4),$(echo $L_END_DATE | cut -c1-4),$(echo $L_END_DATE | cut -c1-4)
   export NL_END_MONTH=$(echo $L_END_DATE | cut -c5-6),$(echo $L_END_DATE | cut -c5-6),$(echo $L_END_DATE | cut -c5-6)
   export NL_END_DAY=$(echo $L_END_DATE | cut -c7-8),$(echo $L_END_DATE | cut -c7-8),$(echo $L_END_DATE | cut -c7-8)
   export NL_END_HOUR=$(echo $L_END_DATE | cut -c9-10),$(echo $L_END_DATE | cut -c9-10),$(echo $L_END_DATE | cut -c9-10)
   export NL_START_DATE=\'${L_START_YEAR}-${L_START_MONTH}-${L_START_DAY}_${L_START_HOUR}:00:00\',\'${L_START_YEAR}-${L_START_MONTH}-${L_START_DAY}_${L_START_HOUR}:00:00\',\'${L_START_YEAR}-${L_START_MONTH}-${L_START_DAY}_${L_START_HOUR}:00:00\'
   export NL_END_DATE=\'${L_END_YEAR}-${L_END_MONTH}-${L_END_DAY}_${L_END_HOUR}:00:00\',\'${L_END_YEAR}-${L_END_MONTH}-${L_END_DAY}_${L_END_HOUR}:00:00\',\'${L_END_YEAR}-${L_END_MONTH}-${L_END_DAY}_${L_END_HOUR}:00:00\'
#
# LOOP THROUGH ALL BDY TENDENCY TIMES
   export P_DATE=${DATE}
   export P_END_DATE=$(${BUILD_DIR}/da_advance_time.exe ${P_DATE} ${FCST_PERIOD} 2>/dev/null)
   while [[ ${P_DATE} -le ${P_END_DATE} ]] ; do
#
# SET WRFDA PARAMETERS
      export ANALYSIS_DATE=$(${BUILD_DIR}/da_advance_time.exe ${P_DATE} 0 -W 2>/dev/null)
      export NL_ANALYSIS_DATE=\'${ANALYSIS_DATE}\'
      export NL_TIME_WINDOW_MIN=\'$(${BUILD_DIR}/da_advance_time.exe ${P_DATE} -${ASIM_WINDOW} -W 2>/dev/null)\'
      export NL_TIME_WINDOW_MAX=\'$(${BUILD_DIR}/da_advance_time.exe ${P_DATE} +${ASIM_WINDOW} -W 2>/dev/null)\'
      export NL_ANALYSIS_TYPE=\'RANDOMCV\'
      export NL_PUT_RAND_SEED=true
#
# LOOP THROUGH ALL MEMBERS IN THE ENSEMBLE
      TRANDOM=$$
      let MEM=1
      while [[ ${MEM} -le ${NUM_MEMBERS} ]]; do
         export CMEM=e${MEM}
         if [[ ${MEM} -lt 100 ]]; then export CMEM=e0${MEM}; fi
         if [[ ${MEM} -lt 10  ]]; then export CMEM=e00${MEM}; fi
#
# COARSE RESOLUTION GRID
         cd ${RUN_DIR}/${DATE}/wrfchem_met_ic
         export LCR_DIR=wrfda_cr_${MEM}
         if [[ ! -e ${LCR_DIR} ]]; then
            mkdir ${LCR_DIR}
            cd ${LCR_DIR}
         else
            cd ${LCR_DIR}
            rm -rf *
         fi
         export NL_E_WE=${NNXP_STAG_CR}
         export NL_E_SN=${NNYP_STAG_CR}
         export NL_DX=${DX_CR}
         export NL_DY=${DX_CR}
         export NL_GRID_ID=1
         export NL_PARENT_ID=0
         export NL_PARENT_GRID_RATIO=1
         export NL_I_PARENT_START=${ISTR_CR}
         export NL_J_PARENT_START=${JSTR_CR}
         export DA_INPUT_FILE=../../real/wrfinput_d${CR_DOMAIN}_${ANALYSIS_DATE}
         export NL_SEED_ARRAY1=$(${BUILD_DIR}/da_advance_time.exe ${DATE} 0 -f hhddmmyycc)
         export NL_SEED_ARRAY2=`echo ${MEM} \* 100000 | bc -l `
         ${HYBRID_SCRIPTS_DIR}/da_create_wrfda_namelist.ksh
         export L_YYYY=$(echo $DATE | cut -c1-4)
         export L_YY=$(echo $DATE | cut -c3-4)
         export L_MM=$(echo $DATE | cut -c5-6)
         export L_DD=$(echo $DATE | cut -c7-8)
         export L_HH=$(echo $DATE | cut -c9-10)
         if [[ ${L_HH} -ge 00 && ${L_HH} -lt 06 ]]; then
            cp ${EXPERIMENT_PREPBUFR_DIR}/prepbufr.gdas.${L_YYYY}${L_MM}${L_DD}.t00z.nr ob.bufr
         elif [[ ${L_HH} -ge 06 && ${L_HH} -lt 12 ]]; then
            cp ${EXPERIMENT_PREPBUFR_DIR}/prepbufr.gdas.${L_YYYY}${L_MM}${L_DD}.t06z.nr ob.bufr
         elif [[ ${L_HH} -ge 12 && ${L_HH} -lt 18 ]]; then
            cp ${EXPERIMENT_PREPBUFR_DIR}/prepbufr.gdas.${L_YYYY}${L_MM}${L_DD}.t12z.nr ob.bufr
         elif [[ ${L_HH} -ge 18 ]]; then
            cp ${EXPERIMENT_PREPBUFR_DIR}/prepbufr.gdas.${L_YYYY}${L_MM}${L_DD}.t18z.nr ob.bufr
         fi
         cp ${DA_INPUT_FILE} fg
         cp ${BE_DIR}/be.dat.cv3 be.dat
         cp ${WRFDA_DIR}/run/LANDUSE.TBL ./.
         cp ${WRFDA_DIR}/var/da/da_wrfvar.exe ./.
#
#         RANDOM=$$
         export JOBRND=${TRANDOM}_wrfda_cr
         ${HYBRID_SCRIPTS_DIR}/job_script_taki.ksh ${JOBRND} ${WRFDA_JOB_CLASS} ${WRFDA_TIME_LIMIT} ${WRFDA_NODES} ${WRFDA_TASKS} da_wrfvar.exe PARALLEL
         sbatch job.ksh
#        mpirun da_wrfvar.exe
#
# MEDIUM RESOLUTION GRID
         cd ${RUN_DIR}/${DATE}/wrfchem_met_ic
         export LMR_DIR=wrfda_mr_${MEM}
         if [[ ! -e ${LMR_DIR} ]]; then
            mkdir ${LMR_DIR}
            cd ${LMR_DIR}
         else
            cd ${LMR_DIR}
            rm -rf *
         fi
         export NL_E_WE=${NNXP_STAG_MR}
         export NL_E_SN=${NNYP_STAG_MR}
         export NL_DX=${DX_MR}
         export NL_DY=${DX_MR}
         export NL_GRID_ID=2
         export NL_PARENT_ID=1
         export NL_PARENT_GRID_RATIO=3
         export NL_I_PARENT_START=${ISTR_MR}
         export NL_J_PARENT_START=${JSTR_MR}
         export DA_INPUT_FILE=../../real/wrfinput_d${MR_DOMAIN}_${ANALYSIS_DATE}
         ${HYBRID_SCRIPTS_DIR}/da_create_wrfda_namelist.ksh
         cp ${DA_INPUT_FILE} fg
         cp ${BE_DIR}/be.dat.cv3 be.dat
         cp ${WRFDA_DIR}/run/LANDUSE.TBL ./.
         cp ${WRFDA_DIR}/var/da/da_wrfvar.exe ./.

         RANDOM=$$
         export JOBRND=${TRANDOM}_wrfda_mr
         ${HYBRID_SCRIPTS_DIR}/job_script_taki.ksh ${JOBRND} ${WRFDA_JOB_CLASS} ${WRFDA_TIME_LIMIT} ${WRFDA_NODES} ${WRFDA_TASKS} da_wrfvar.exe PARALLEL
         sbatch job.ksh

# FINE RESOLUTION GRID
         cd ${RUN_DIR}/${DATE}/wrfchem_met_ic
         export LFR_DIR=wrfda_fr_${MEM}
         if [[ ! -e ${LFR_DIR} ]]; then
            mkdir ${LFR_DIR}
            cd ${LFR_DIR}
         else
            cd ${LFR_DIR}
            rm -rf *
         fi
         export NL_E_WE=${NNXP_STAG_FR}
         export NL_E_SN=${NNYP_STAG_FR}
         export NL_DX=${DX_FR}
         export NL_DY=${DX_FR}
         export NL_GRID_ID=3
         export NL_PARENT_ID=2
         export NL_PARENT_GRID_RATIO=3
         export NL_I_PARENT_START=${ISTR_FR}
         export NL_J_PARENT_START=${JSTR_FR}
         export DA_INPUT_FILE=../../real/wrfinput_d${FR_DOMAIN}_${ANALYSIS_DATE}
         ${HYBRID_SCRIPTS_DIR}/da_create_wrfda_namelist.ksh
         cp ${DA_INPUT_FILE} fg
         cp ${BE_DIR}/be.dat.cv3 be.dat
         cp ${WRFDA_DIR}/run/LANDUSE.TBL ./.
         cp ${WRFDA_DIR}/var/da/da_wrfvar.exe ./.

         RANDOM=$$
         export JOBRND=${TRANDOM}_wrfda_fr
         ${HYBRID_SCRIPTS_DIR}/job_script_taki.ksh ${JOBRND} ${WRFDA_JOB_CLASS} ${WRFDA_TIME_LIMIT} ${WRFDA_NODES} ${WRFDA_TASKS} da_wrfvar.exe PARALLEL
         sbatch job.ksh

         let MEM=${MEM}+1
      done
#
# Wait for WRFDA to complete for all members
      cd ${RUN_DIR}/${DATE}/wrfchem_met_ic
      ${HYBRID_SCRIPTS_DIR}/da_run_hold_taki.ksh ${TRANDOM}
#
      let MEM=1
      while [[ ${MEM} -le ${NUM_MEMBERS} ]]; do
         export CMEM=e${MEM}
         if [[ ${MEM} -lt 100 ]]; then export CMEM=e0${MEM}; fi
         if [[ ${MEM} -lt 10  ]]; then export CMEM=e00${MEM}; fi
         export LCR_DIR=wrfda_cr_${MEM}
         export LMR_DIR=wrfda_mr_${MEM}
         export LFR_DIR=wrfda_fr_${MEM}
         if [[ -e ${LCR_DIR}/wrfvar_output ]]; then
            cp ${LCR_DIR}/wrfvar_output wrfinput_d${CR_DOMAIN}_${ANALYSIS_DATE}.${CMEM}
         else
            sleep 45
            cp ${LCR_DIR}/wrfvar_output wrfinput_d${CR_DOMAIN}_${ANALYSIS_DATE}.${CMEM}
         fi 
         if [[ -e ${LMR_DIR}/wrfvar_output ]]; then
            cp ${LMR_DIR}/wrfvar_output wrfinput_d${MR_DOMAIN}_${ANALYSIS_DATE}.${CMEM}
         else
            sleep 45
            cp ${LMR_DIR}/wrfvar_output wrfinput_d${MR_DOMAIN}_${ANALYSIS_DATE}.${CMEM}
         fi
         if [[ -e ${LFR_DIR}/wrfvar_output ]]; then
            cp ${LFR_DIR}/wrfvar_output wrfinput_d${FR_DOMAIN}_${ANALYSIS_DATE}.${CMEM}
         else
            sleep 45
            cp ${LFR_DIR}/wrfvar_output wrfinput_d${FR_DOMAIN}_${ANALYSIS_DATE}.${CMEM}
         fi

         let MEM=${MEM}+1
      done
      export P_DATE=$(${BUILD_DIR}/da_advance_time.exe ${P_DATE} ${MET_INTERVAL_HR} 2>/dev/null) 
   done
   export NL_E_WE=${NNXP_STAG_CR},${NNXP_STAG_MR},${NNXP_STAG_FR}
   export NL_E_SN=${NNYP_STAG_CR},${NNYP_STAG_MR},${NNYP_STAG_FR}
   export NL_DX=${DX_CR},${DX_MR},${DX_FR}
   export NL_DY=${DX_CR},${DX_MR},${DX_FR}
   export NL_GRID_ID=1,2,3
   export NL_PARENT_ID=0,1,2
   export NL_PARENT_GRID_RATIO=1,3,3
   export NL_I_PARENT_START=${ISTR_CR},${ISTR_MR},${ISTR_FR}
   export NL_J_PARENT_START=${JSTR_CR},${JSTR_MR},${JSTR_FR}
fi
#
#########################################################################
#
# RUN PERT WRFCHEM MET BC
#
#########################################################################
#
if [[ ${RUN_PERT_WRFCHEM_MET_BC} = "true" ]]; then 
   if [[ ! -d ${RUN_DIR}/${DATE}/wrfchem_met_bc ]]; then
      mkdir -p ${RUN_DIR}/${DATE}/wrfchem_met_bc
      cd ${RUN_DIR}/${DATE}/wrfchem_met_bc
   else
      cd ${RUN_DIR}/${DATE}/wrfchem_met_bc
   fi
#
# LOOP THROUGH ALL MEMBERS IN THE ENSEMBLE
   let MEM=1
   while [[ ${MEM} -le ${NUM_MEMBERS} ]]; do
      export CMEM=e${MEM}
      if [[ ${MEM} -lt 100 ]]; then export CMEM=e0${MEM}; fi
      if [[ ${MEM} -lt 10  ]]; then export CMEM=e00${MEM}; fi
      export ANALYSIS_DATE=$(${BUILD_DIR}/da_advance_time.exe ${DATE} 0 -W 2>/dev/null)
      if [[ -f wrfbdy_this ]]; then
         rm -rf wrfbdy_this
         export DA_BDY_PATH=${RUN_DIR}/${DATE}/real
         export DA_BDY_FILE=${DA_BDY_PATH}/wrfbdy_d${CR_DOMAIN}_${ANALYSIS_DATE}
         cp ${DA_BDY_FILE} wrfbdy_this
      else
         export DA_BDY_PATH=${RUN_DIR}/${DATE}/real
         export DA_BDY_FILE=${DA_BDY_PATH}/wrfbdy_d${CR_DOMAIN}_${ANALYSIS_DATE}
         cp ${DA_BDY_FILE} wrfbdy_this
      fi
      rm -rf pert_wrf_bc
      cp ${DART_DIR}/models/wrf_chem/work/pert_wrf_bc ./.
      rm -rf input.nml
      ${DART_DIR}/models/wrf_chem/namelist_scripts/DART/dart_create_input.nml.ksh
#
# LOOP THROUGH ALL BDY TENDENCY TIMES FOR THIS MEMBER.
      export L_DATE=${DATE}
      export L_END_DATE=$(${BUILD_DIR}/da_advance_time.exe ${L_DATE} ${FCST_PERIOD} 2>/dev/null)
      TRANDOM=$$
      while [[ ${L_DATE} -lt ${L_END_DATE} ]]; do
         export ANALYSIS_DATE=$(${BUILD_DIR}/da_advance_time.exe ${L_DATE} 0 -W 2>/dev/null)
         export NEXT_L_DATE=$(${BUILD_DIR}/da_advance_time.exe ${L_DATE} ${MET_INTERVAL_HR} 2>/dev/null)
         export NEXT_ANALYSIS_DATE=$(${BUILD_DIR}/da_advance_time.exe ${L_DATE} ${MET_INTERVAL_HR} -W 2>/dev/null)
         rm -rf wrfinput_this
         rm -rf wrfinput_next
         export DA_INPUT_PATH=${RUN_DIR}/${DATE}/wrfchem_met_ic
         ln -fs ${DA_INPUT_PATH}/wrfinput_d${CR_DOMAIN}_${ANALYSIS_DATE}.${CMEM} wrfinput_this 
         ln -fs ${DA_INPUT_PATH}/wrfinput_d${CR_DOMAIN}_${NEXT_ANALYSIS_DATE}.${CMEM} wrfinput_next 
#
#         RANDOM=$$
         export JOBRND=${TRANDOM}_pert_bc
         ${HYBRID_SCRIPTS_DIR}/job_script_taki.ksh ${JOBRND} ${SINGLE_JOB_CLASS} ${SINGLE_TIME_LIMIT} ${SINGLE_NODES} ${SINGLE_TASKS} pert_wrf_bc SERIAL
         sbatch job.ksh
         export L_DATE=${NEXT_L_DATE} 
      done
      ${HYBRID_SCRIPTS_DIR}/da_run_hold_taki.ksh ${TRANDOM}
      export ANALYSIS_DATE=$(${BUILD_DIR}/da_advance_time.exe ${DATE} 0 -W 2>/dev/null)
      mv wrfbdy_this wrfbdy_d${CR_DOMAIN}_${ANALYSIS_DATE}.${CMEM}
      let MEM=${MEM}+1
   done
fi
#
#########################################################################
#
# RUN EXO_COLDENS
#
#########################################################################
#
if ${RUN_EXO_COLDENS}; then
   if [[ ! -d ${RUN_DIR}/${DATE}/exo_coldens ]]; then
      mkdir -p ${RUN_DIR}/${DATE}/exo_coldens
      cd ${RUN_DIR}/${DATE}/exo_coldens
   else
      cd ${RUN_DIR}/${DATE}/exo_coldens
   fi
#
# LINK NEEDED FILES
   export FILE_CR=wrfinput_d${CR_DOMAIN}
   export FILE_MR=wrfinput_d${MR_DOMAIN}
   export FILE_FR=wrfinput_d${FR_DOMAIN}
   rm -rf ${FILE_CR}
   rm -rf ${FILE_MR}
   rm -rf ${FILE_FR}
   ln -sf ${REAL_DIR}/${FILE_CR}_${FILE_DATE} ${FILE_CR}   
   ln -sf ${REAL_DIR}/${FILE_MR}_${FILE_DATE} ${FILE_MR}   
   ln -sf ${REAL_DIR}/${FILE_FR}_${FILE_DATE} ${FILE_FR}   
   export FILE=exo_coldens.nc
   rm -rf ${FILE}
   ln -sf ${EXPERIMENT_COLDENS_DIR}/${FILE} ${FILE}
   export FILE=exo_coldens.exe
   rm -rf ${FILE}
   ln -sf ${WES_COLDENS_DIR}/work/${FILE} ${FILE}
#
# CREATE INPUT FILE
   export FILE=exo_coldens.inp
   rm -rf ${FILE}
   cat << EOF > ${FILE}
&control
domains = 3,
/
EOF
#
# RUN exo_coldens
   ./exo_coldens.exe < exo_coldens.inp
#
# TEST WHETHER OUTPUT EXISTS
   export FILE_CR=exo_coldens_d${CR_DOMAIN}
   export FILE_MR=exo_coldens_d${MR_DOMAIN}
   export FILE_FR=exo_coldens_d${FR_DOMAIN}
   if [[ ! -e ${FILE_CR} || ! -e ${FILE_MR} || ! -e ${FILE_FR} ]]; then
      echo EXO_COLDENS FAILED
      exit
   else
      echo EXO_COLDENS SUCCESS
   fi
fi
#
#########################################################################
#
# RUN SEASONS_WES
#
#########################################################################
#
if ${RUN_SEASON_WES}; then
   if [[ ! -d ${RUN_DIR}/${DATE}/seasons_wes ]]; then
      mkdir -p ${RUN_DIR}/${DATE}/seasons_wes
      cd ${RUN_DIR}/${DATE}/seasons_wes
   else
      cd ${RUN_DIR}/${DATE}/seasons_wes
   fi
#
# LINK NEEDED FILES
   export FILE_CR=wrfinput_d${CR_DOMAIN}
   export FILE_MR=wrfinput_d${MR_DOMAIN}
   export FILE_FR=wrfinput_d${FR_DOMAIN}
   rm -rf ${FILE_CR}
   rm -rf ${FILE_MR}
   rm -rf ${FILE_FR}
   ln -sf ${REAL_DIR}/${FILE_CR}_${FILE_DATE} ${FILE_CR}   
   ln -sf ${REAL_DIR}/${FILE_MR}_${FILE_DATE} ${FILE_MR}   
   ln -sf ${REAL_DIR}/${FILE_FR}_${FILE_DATE} ${FILE_FR}   
   export FILE=season_wes_usgs.nc
   rm -rf ${FILE}
   ln -sf ${EXPERIMENT_COLDENS_DIR}/${FILE} ${FILE}
   export FILE=wesely.exe
   rm -rf ${FILE}
   ln -sf ${WES_COLDENS_DIR}/work/${FILE} ${FILE}
#
# CREATE INPUT FILE
   export FILE=wesely.inp
   rm -rf ${FILE}
   cat << EOF > ${FILE}
&control
domains = 3,
/
EOF
#
# RUN wesely
   ./wesely.exe < wesely.inp
#
# TEST WHETHER OUTPUT EXISTS
   export FILE_CR=wrf_season_wes_usgs_d${CR_DOMAIN}.nc
   export FILE_MR=wrf_season_wes_usgs_d${MR_DOMAIN}.nc
   export FILE_FR=wrf_season_wes_usgs_d${FR_DOMAIN}.nc
   if [[ ! -e ${FILE_CR} || ! -e ${FILE_MR} || ! -e ${FILE_FR} ]]; then
      echo WESELY FAILED
      exit
   else
      echo WESELY SUCCESS
   fi
fi
#
#########################################################################
#
# RUN WRFCHEM_BIO
#
#########################################################################
#
if ${RUN_WRFCHEM_BIO}; then
   if [[ ! -d ${RUN_DIR}/${DATE}/wrfchem_bio ]]; then
      mkdir -p ${RUN_DIR}/${DATE}/wrfchem_bio
      cd ${RUN_DIR}/${DATE}/wrfchem_bio
   else
      cd ${RUN_DIR}/${DATE}/wrfchem_bio
   fi
#
# LOOP THROUGH CURRENT AND NEXT DATE
   export L_DATE=${DATE}
   export LE_DATE=$(${BUILD_DIR}/da_advance_time.exe ${L_DATE} ${FCST_PERIOD} 2>/dev/null)
   while [[ ${L_DATE} -le ${LE_DATE} ]]; do 
      export L_YYYY=$(echo $L_DATE | cut -c1-4)
      export L_MM=$(echo $L_DATE | cut -c5-6)
      export L_DD=$(echo $L_DATE | cut -c7-8)
      export L_HH=$(echo $L_DATE | cut -c9-10)
      export L_FILE_DATE=${L_YYYY}-${L_MM}-${L_DD}_${L_HH}:00:00
#
# LINK NEEDED FILES
      export FILE_CR=wrfinput_d${CR_DOMAIN}
      export FILE_MR=wrfinput_d${MR_DOMAIN}
      export FILE_FR=wrfinput_d${FR_DOMAIN}
      rm -rf ${FILE_CR}
      rm -rf ${FILE_MR}
      rm -rf ${FILE_FR}
      ln -sf ${REAL_DIR}/${FILE_CR}_${L_FILE_DATE} ${FILE_CR}   
      ln -sf ${REAL_DIR}/${FILE_MR}_${L_FILE_DATE} ${FILE_MR}   
      ln -sf ${REAL_DIR}/${FILE_FR}_${L_FILE_DATE} ${FILE_FR}   
      export FILE_CR=wrfbiochemi_d${CR_DOMAIN}
      export FILE_MR=wrfbiochemi_d${MR_DOMAIN}
      export FILE_FR=wrfbiochemi_d${FR_DOMAIN}
      if [[ ${L_DATE} -eq ${DATE} ]]; then
         rm -rf ${FILE_CR}
         rm -rf ${FILE_MR}
         rm -rf ${FILE_FR}
      fi
      rm -rf btr*.nc
      rm -rf DSW*.nc
      rm -rf hrb*.nc
      rm -rf iso*.nc
      rm -rf lai*.nc
      rm -rf ntr*.nc
      rm -rf shr*.nc
      rm -rf TAS*.nc
      ln -sf ${EXPERIMENT_WRFBIOCHEMI_DIR}/MEGAN-DATA/*.nc ./.
      export FILE=megan_bio_emiss.exe
      rm -rf ${FILE}
      cp ${MEGAN_BIO_DIR}/work/${FILE} ${FILE}
#
# CREATE INPUT FILE
      export FILE=megan_bio_emiss.inp
      rm -rf ${FILE}
      cat << EOF > ${FILE}
&control
domains = 3,
start_lai_mnth = 1,
end_lai_mnth = 12
/
EOF
#
      RANDOM=$$
      export JOBRND=${RANDOM}_bio
      ${HYBRID_SCRIPTS_DIR}/job_script_taki.ksh ${JOBRND} ${BIO_JOB_CLASS} ${BIO_TIME_LIMIT} ${BIO_NODES} ${BIO_TASKS} "megan_bio_emiss.exe < megan_bio_emiss.inp" SERIAL
      sbatch -W job.ksh
#
# TEST WHETHER OUTPUT EXISTS
      export FILE_CR=wrfbiochemi_d${CR_DOMAIN}
      export FILE_MR=wrfbiochemi_d${MR_DOMAIN}
      export FILE_FR=wrfbiochemi_d${FR_DOMAIN}
      if [[ ! -e ${FILE_CR} || ! -e ${FILE_MR} || ! -e ${FILE_FR} ]]; then
         echo WRFCHEM_BIO FAILED
         exit
      else
         echo WRFCHEM_BIO SUCCESS
         mv ${FILE_CR} ${FILE_CR}_${L_FILE_DATE}
         mv ${FILE_MR} ${FILE_MR}_${L_FILE_DATE}
         mv ${FILE_FR} ${FILE_FR}_${L_FILE_DATE}
      fi
      export L_DATE=$(${BUILD_DIR}/da_advance_time.exe ${L_DATE} ${MET_INTERVAL_HR} 2>/dev/null)
   done
fi
#
#########################################################################
#
# RUN WRFCHEM_FIRE
#
#########################################################################
#
if ${RUN_WRFCHEM_FIRE}; then
   if [[ ! -d ${RUN_DIR}/${DATE}/wrfchem_fire ]]; then
      mkdir -p ${RUN_DIR}/${DATE}/wrfchem_fire
      cd ${RUN_DIR}/${DATE}/wrfchem_fire
   else
      cd ${RUN_DIR}/${DATE}/wrfchem_fire
   fi
#
# LINK NEEDED FILES
   export FILE_CR=wrfinput_d${CR_DOMAIN}
   export FILE_MR=wrfinput_d${MR_DOMAIN}
   export FILE_FR=wrfinput_d${FR_DOMAIN}
   rm -rf ${FILE_CR}
   rm -rf ${FILE_MR}
   rm -rf ${FILE_FR}
   ln -sf ${REAL_DIR}/${FILE_CR}_${FILE_DATE} ${FILE_CR}   
   ln -sf ${REAL_DIR}/${FILE_MR}_${FILE_DATE} ${FILE_MR}   
   ln -sf ${REAL_DIR}/${FILE_FR}_${FILE_DATE} ${FILE_FR}   
   rm -rf GLOBAL*.txt
   ln -sf ${EXPERIMENT_WRFFIRECHEMI_DIR}/GLOBAL*.txt ./.
   export FILE=fire_emis.exe
   rm -rf ${FILE}
   ln -sf ${FINN_FIRE_DIR}/work/${FILE} ${FILE}
   rm -rf grass_from_img.nc
   rm -rf shrub_from_img.nc
   rm -rf tempfor_from_img.nc
   rm -rf tropfor_from_img.nc
   ln -sf ${EXPERIMENT_WRFFIRECHEMI_DIR}/grass_from_img.nc
   ln -sf ${EXPERIMENT_WRFFIRECHEMI_DIR}/shrub_from_img.nc
   ln -sf ${EXPERIMENT_WRFFIRECHEMI_DIR}/tempfor_from_img.nc
   ln -sf ${EXPERIMENT_WRFFIRECHEMI_DIR}/tropfor_from_img.nc
#
# CREATE INPUT FILE
   export FILE=fire_emis.mozc.inp
   rm -rf ${FILE}
   cat << EOF > ${FILE}
&control
domains = 3,
fire_filename(1) = 'GLOBAL_FINNv15_2015_MOZ4_11032016.txt',
start_date = '${FIRE_START_DATE}', 
end_date = '${FIRE_END_DATE}',
fire_directory = './',
wrf_directory = './',
wrf2fire_map = 'co -> CO', 'no -> NO', 'so2 -> SO2', 'bigalk -> BIGALK',
               'bigene -> BIGENE', 'c2h4 -> C2H4', 'c2h5oh -> C2H5OH',
               'c2h6 -> C2H6', 'c3h8 -> C3H8','c3h6 -> C3H6','ch2o -> CH2O', 'ch3cho -> CH3CHO',
               'ch3coch3 -> CH3COCH3','ch3oh -> CH3OH','mek -> MEK','toluene -> TOLUENE',
               'nh3 -> NH3','no2 -> NO2','open -> BIGALD','c10h16 -> C10H16',
               'ch3cooh -> CH3COOH','cres -> CRESOL','glyald -> GLYALD','mgly -> CH3COCHO',
               'gly -> CH3COCHO','acetol -> HYAC','isop -> ISOP','macr -> MACR'
               'mvk -> MVK',
               'oc -> OC;aerosol','bc -> BC;aerosol'
/
EOF
#
   RANDOM=$$
   export JOBRND=${RANDOM}_fire
   ${HYBRID_SCRIPTS_DIR}/job_script_taki.ksh ${JOBRND} ${GENERAL_JOB_CLASS} ${GENERAL_TIME_LIMIT} ${GENERAL_NODES} ${GENERAL_TASKS} "fire_emis.exe < fire_emis.mozc.inp" SERIAL
   sbatch -W job.ksh
#
   export L_DATE=${DATE}
   while [[ ${L_DATE} -le ${END_DATE} ]]; do
      export L_YYYY=$(echo $L_DATE | cut -c1-4)
      export L_MM=$(echo $L_DATE | cut -c5-6)
      export L_DD=$(echo $L_DATE | cut -c7-8)
      export L_HH=$(echo $L_DATE | cut -c9-10)
      export L_FILE_DATE=${L_YYYY}-${L_MM}-${L_DD}_${L_HH}:00:00
      export DD_DATE=${L_YYYY}${L_MM}${L_DD}
#
# TEST WHETHER OUTPUT EXISTS
      export FILE_CR=wrffirechemi_d${CR_DOMAIN}_${L_FILE_DATE}
      export FILE_MR=wrffirechemi_d${MR_DOMAIN}_${L_FILE_DATE}
      export FILE_FR=wrffirechemi_d${FR_DOMAIN}_${L_FILE_DATE}
      if [[ ! -e ${FILE_CR} || ! -e ${FILE_MR} || ! -e ${FILE_FR} ]]; then
         echo WRFFIRE FAILED
         exit
      else
         echo WRFFIRE SUCCESS
      fi
      export L_DATE=$(${BUILD_DIR}/da_advance_time.exe ${L_DATE} 1 2>/dev/null)
   done
fi
#
#########################################################################
#
# RUN WRFCHEM_CHEMI
#
#########################################################################
#
if ${RUN_WRFCHEM_CHEMI}; then
   if [[ ! -d ${RUN_DIR}/${DATE}/wrfchem_chemi ]]; then
      mkdir -p ${RUN_DIR}/${DATE}/wrfchem_chemi
      cd ${RUN_DIR}/${DATE}/wrfchem_chemi
   else
      cd ${RUN_DIR}/${DATE}/wrfchem_chemi
   fi
   export L_DATE=${DATE}
   export LE_DATE=$(${BUILD_DIR}/da_advance_time.exe ${L_DATE} ${FCST_PERIOD} 2>/dev/null)
#
   while [[ ${L_DATE} -le ${LE_DATE} ]]; do
      export L_YYYY=$(echo $L_DATE | cut -c1-4)
      export L_MM=$(echo $L_DATE | cut -c5-6)
      export L_DD=$(echo $L_DATE | cut -c7-8)
      export L_HH=$(echo $L_DATE | cut -c9-10)
#
      export FILE_PATH=${EXPERIMENT_WRFCHEMI_DIR}
      cp ${FILE_PATH}/wrfchemi_d${CR_DOMAIN}_${L_YYYY}-${L_MM}-${L_DD}_${L_HH}:00:00 ./.
      cp ${FILE_PATH}/wrfchemi_d${MR_DOMAIN}_${L_YYYY}-${L_MM}-${L_DD}_${L_HH}:00:00 ./.
      cp ${FILE_PATH}/wrfchemi_d${FR_DOMAIN}_${L_YYYY}-${L_MM}-${L_DD}_${L_HH}:00:00 ./.
      chmod a+rwx wrfchemi_d${CR_DOMAIN}_${L_YYYY}-${L_MM}-${L_DD}_${L_HH}:00:00 
      chmod a+rwx wrfchemi_d${MR_DOMAIN}_${L_YYYY}-${L_MM}-${L_DD}_${L_HH}:00:00 
      chmod a+rwx wrfchemi_d${FR_DOMAIN}_${L_YYYY}-${L_MM}-${L_DD}_${L_HH}:00:00 
      export L_DATE=$(${BUILD_DIR}/da_advance_time.exe ${L_DATE} 1 2>/dev/null)
   done
fi
#
#########################################################################
#
# RUN WRFCHEM PERTURB ICBC
#
#########################################################################
#
if ${RUN_PERT_WRFCHEM_CHEM_ICBC}; then
   if [[ ! -d ${RUN_DIR}/${DATE}/wrfchem_chem_icbc ]]; then
      mkdir -p ${RUN_DIR}/${DATE}/wrfchem_chem_icbc
      cd ${RUN_DIR}/${DATE}/wrfchem_chem_icbc
   else
      cd ${RUN_DIR}/${DATE}/wrfchem_chem_icbc
   fi
   export NL_SW_GENERATE=false
   if [[ ${DATE} -eq ${INITIAL_DATE} && ${PERT_CHEM_GENER} == true ]]; then export NL_SW_GENERATE=true; fi
#
# PERTURB CHEM ICBC
   cp ${PERT_CHEM_INPUT_DIR}/work/mozbc.exe ./.
   cp ${PERT_CHEM_INPUT_DIR}/runICBC_parent_rt_CR.ksh ./.
   cp ${PERT_CHEM_INPUT_DIR}/runICBC_parent_rt_MR.ksh ./.
   cp ${PERT_CHEM_INPUT_DIR}/runICBC_parent_rt_FR.ksh ./.
   cp ${PERT_CHEM_INPUT_DIR}/runICBC_setN_rt_CR.ksh ./.
   cp ${PERT_CHEM_INPUT_DIR}/runICBC_setN_rt_MR.ksh ./.
   cp ${PERT_CHEM_INPUT_DIR}/runICBC_setN_rt_FR.ksh ./.
   cp ${PERT_CHEM_INPUT_DIR}/random_correlated_perts_mirror.py ./APM_random.py
   cp ${PERT_CHEM_INPUT_DIR}/run_mozbc_rt_CR.csh ./.
   cp ${PERT_CHEM_INPUT_DIR}/run_mozbc_rt_MR.csh ./.
   cp ${PERT_CHEM_INPUT_DIR}/run_mozbc_rt_FR.csh ./.
   cp ${PERT_CHEM_INPUT_DIR}/set0 ./.
   cp ${PERT_CHEM_INPUT_DIR}/set00 ./.
#
# SELECT MOZART DATA FILE
#  if [[ ${YYYY} -eq 2014 ]]; then export MOZBC_DATA=/h0003.nc; fi
  if [[ ${YYYY} -eq 2015 ]]; then export MOZBC_DATA=/h0005.nc; fi
#
# CREATE INPUT FILES COARSE DOMAIN
   rm -rf mozbc.ic.inp
   cat << EOF > mozbc.ic.inp
&control
do_bc     = .false.
do_ic     = .true.
domain    = 1
dir_wrf   = '${RUN_DIR}/${DATE}/wrfchem_chem_icbc/'
dir_moz   = '${MOZBC_DATA_DIR}'
fn_moz    = '${MOZBC_DATA}'
def_missing_var    = .true.
met_file_prefix    = 'met_em'
met_file_suffix    = '.nc'
met_file_separator = '.'
EOF
   rm -rf mozbc.bc.inp
   cat << EOF > mozbc.bc.inp
&control
do_bc     = .true.
do_ic     = .false.
domain    = 1
dir_wrf   = '${RUN_DIR}/${DATE}/wrfchem_chem_icbc/'
dir_moz   = '${MOZBC_DATA_DIR}'
fn_moz    = '${MOZBC_DATA}'
def_missing_var    = .true.
met_file_prefix    = 'met_em'
met_file_suffix    = '.nc'
met_file_separator = '.'
EOF
   cp ${METGRID_DIR}/met_em.d${CR_DOMAIN}.*:00:00.nc ./.
   if [[ -f job.ksh ]]; then rm -rf job.ksh; fi
   touch job.ksh
   RANDOM=$$
   export JOBRND=${RANDOM}_icbc_pert_cr
   cat << EOF > job.ksh
#!/bin/ksh -aeux
#SBATCH --job-name ${JOBRND}
#SBATCH --qos ${GENERAL_JOB_CLASS}
#SBATCH --time ${GENERAL_TIME_LIMIT}
#SBATCH --output ${JOBRND}.log-%j.out
#SBATCH --nodes ${GENERAL_NODES}
#SBATCH --ntasks ${GENERAL_TASKS}
#SBATCH --partition high_mem
#
/usr/ebuild/software/Python/2.7.15-foss-2018b/bin/python APM_random.py ${MOZ_SPREAD} ${NUM_MEMBERS} ${PERT_CHEM_INPUT_DIR} ${RUN_DIR}/${DATE}/wrfchem_chem_icbc ${RUN_DIR} ${NL_SW_GENERATE}
export RC=\$?     
if [[ -f SUCCESS ]]; then rm -rf SUCCESS; fi     
if [[ -f FAILED ]]; then rm -rf FAILED; fi          
if [[ \$RC = 0 ]]; then
   touch SUCCESS
else
   touch FAILED 
   exit
fi
EOF
   sbatch -W job.ksh 
#
   ./runICBC_parent_rt_CR.ksh
   ./runICBC_setN_rt_CR.ksh

#
#----------------------------------------------------------------------
# CREATE INPUT FILES MEDIUM DOMAIN
   rm -rf mozbc.ic.inp
   cat << EOF > mozbc.ic.inp
&control
do_bc     = .false.
do_ic     = .true.
domain    = 2
dir_wrf   = '${RUN_DIR}/${DATE}/wrfchem_chem_icbc/'
dir_moz   = '${MOZBC_DATA_DIR}'
fn_moz    = '${MOZBC_DATA}'
def_missing_var    = .true.
met_file_prefix    = 'met_em'
met_file_suffix    = '.nc'
met_file_separator = '.'
EOF
   rm -rf mozbc.bc.inp
   cat << EOF > mozbc.bc.inp
&control
do_bc     = .true.
do_ic     = .false.
domain    = 2
dir_wrf   = '${RUN_DIR}/${DATE}/wrfchem_chem_icbc/'
dir_moz   = '${MOZBC_DATA_DIR}'
fn_moz    = '${MOZBC_DATA}'
def_missing_var    = .true.
met_file_prefix    = 'met_em'
met_file_suffix    = '.nc'
met_file_separator = '.'
EOF
   cp ${METGRID_DIR}/met_em.d${MR_DOMAIN}.*:00:00.nc ./.
   if [[ -f job.ksh ]]; then rm -rf job.ksh; fi
   touch job.ksh
   RANDOM=$$
   export JOBRND=${RANDOM}_icbc_pert_mr
   cat << EOF > job.ksh
#!/bin/ksh -aeux
#SBATCH --job-name ${JOBRND}
#SBATCH --qos ${GENERAL_JOB_CLASS}
#SBATCH --time ${GENERAL_TIME_LIMIT}
#SBATCH --output ${JOBRND}.log-%j.out
#SBATCH --nodes ${GENERAL_NODES}
#SBATCH --ntasks ${GENERAL_TASKS}
#SBATCH --partition batch
#
/usr/ebuild/software/Python/2.7.15-foss-2018b/bin/python APM_random.py ${MOZ_SPREAD} ${NUM_MEMBERS} ${PERT_CHEM_INPUT_DIR} ${RUN_DIR}/${DATE}/wrfchem_chem_icbc ${RUN_DIR} ${NL_SW_GENERATE}
export RC=\$?     
if [[ -f SUCCESS ]]; then rm -rf SUCCESS; fi     
if [[ -f FAILED ]]; then rm -rf FAILED; fi          
if [[ \$RC = 0 ]]; then
   touch SUCCESS
else
   touch FAILED 
   exit
fi
EOF
   sbatch -W job.ksh 

   ./runICBC_parent_rt_MR.ksh
   ./runICBC_setN_rt_MR.ksh

#
#----------------------------------------------------------------------
# CREATE INPUT FILES FINE DOMAIN
   rm -rf mozbc.ic.inp
   cat << EOF > mozbc.ic.inp
&control
do_bc     = .false.
do_ic     = .true.
domain    = 3
dir_wrf   = '${RUN_DIR}/${DATE}/wrfchem_chem_icbc/'
dir_moz   = '${MOZBC_DATA_DIR}'
fn_moz    = '${MOZBC_DATA}'
def_missing_var    = .true.
met_file_prefix    = 'met_em'
met_file_suffix    = '.nc'
met_file_separator = '.'
EOF
   rm -rf mozbc.bc.inp
   cat << EOF > mozbc.bc.inp
&control
do_bc     = .true.
do_ic     = .false.
domain    = 3
dir_wrf   = '${RUN_DIR}/${DATE}/wrfchem_chem_icbc/'
dir_moz   = '${MOZBC_DATA_DIR}'
fn_moz    = '${MOZBC_DATA}'
def_missing_var    = .true.
met_file_prefix    = 'met_em'
met_file_suffix    = '.nc'
met_file_separator = '.'
EOF
   cp ${METGRID_DIR}/met_em.d${FR_DOMAIN}.*:00:00.nc ./.
   if [[ -f job.ksh ]]; then rm -rf job.ksh; fi
   touch job.ksh
   RANDOM=$$
   export JOBRND=${RANDOM}_icbc_pert_fr
   cat << EOF > job.ksh
#!/bin/ksh -aeux
#SBATCH --job-name ${JOBRND}
#SBATCH --qos ${GENERAL_JOB_CLASS}
#SBATCH --time ${GENERAL_TIME_LIMIT}
#SBATCH --output ${JOBRND}.log-%j.out
#SBATCH --nodes ${GENERAL_NODES}
#SBATCH --ntasks ${GENERAL_TASKS}
#SBATCH --partition batch
#
/usr/ebuild/software/Python/2.7.15-foss-2018b/bin/python APM_random.py ${MOZ_SPREAD} ${NUM_MEMBERS} ${PERT_CHEM_INPUT_DIR} ${RUN_DIR}/${DATE}/wrfchem_chem_icbc ${RUN_DIR} ${NL_SW_GENERATE}
export RC=\$?     
if [[ -f SUCCESS ]]; then rm -rf SUCCESS; fi     
if [[ -f FAILED ]]; then rm -rf FAILED; fi          
if [[ \$RC = 0 ]]; then
   touch SUCCESS
else
   touch FAILED 
   exit
fi
EOF
   sbatch -W job.ksh

   ./runICBC_parent_rt_FR.ksh
   ./runICBC_setN_rt_FR.ksh

#
# COMBINE WRFCHEM WITH WRF CR PARENT FILES
   export WRFINPEN=wrfinput_d${CR_DOMAIN}_${YYYY}-${MM}-${DD}_${HH}:00:00
   export WRFBDYEN=wrfbdy_d${CR_DOMAIN}_${YYYY}-${MM}-${DD}_${HH}:00:00
   ncks -A ${REAL_DIR}/${WRFINPEN} ${WRFINPEN}
#  ncks -A ${EXPERIMENT_DUST_DIR}/EROD_d${CR_DOMAIN} ${WRFINPEN}
   ncks -A ${REAL_DIR}/${WRFBDYEN} ${WRFBDYEN}
#
# COMBINE WRFCHEM WITH WRF MR DOMAIN PARENT FILES
   export WRFINPEN=wrfinput_d${MR_DOMAIN}_${YYYY}-${MM}-${DD}_${HH}:00:00
   ncks -A ${REAL_DIR}/${WRFINPEN} ${WRFINPEN}
#   ncks -A ${EXPERIMENT_DUST_DIR}/EROD_d${MR_DOMAIN} ${WRFINPEN}
#
# COMBINE WRFCHEM WITH WRF FR DOMAIN PARENT FILES
   export WRFINPEN=wrfinput_d${FR_DOMAIN}_${YYYY}-${MM}-${DD}_${HH}:00:00
   ncks -A ${REAL_DIR}/${WRFINPEN} ${WRFINPEN}
#   ncks -A ${EXPERIMENT_DUST_DIR}/EROD_d${FR_DOMAIN} ${WRFINPEN}

#
# LOOP THROUGH ALL MEMBERS IN THE ENSEMBLE
   let MEM=1
   while [[ ${MEM} -le ${NUM_MEMBERS} ]]; do
      export CMEM=e${MEM}
      if [[ ${MEM} -lt 100 ]]; then export CMEM=e0${MEM}; fi
      if [[ ${MEM} -lt 10  ]]; then export CMEM=e00${MEM}; fi
#
# COMBINE WRFCHEM WITH WRF CR DOMAIN
      export WRFINPEN=wrfinput_d${CR_DOMAIN}_${YYYY}-${MM}-${DD}_${HH}:00:00.${CMEM}
      export WRFBDYEN=wrfbdy_d${CR_DOMAIN}_${YYYY}-${MM}-${DD}_${HH}:00:00.${CMEM}
      ncks -A ${WRFCHEM_MET_IC_DIR}/${WRFINPEN} ${WRFINPEN}
#     ncks -A ${EXPERIMENT_DUST_DIR}/EROD_d${CR_DOMAIN} ${WRFINPEN}
      ncks -A ${WRFCHEM_MET_BC_DIR}/${WRFBDYEN} ${WRFBDYEN}
#
# COMBINE WRFCHEM WITH WRF MR DOMAIN
      export WRFINPEN=wrfinput_d${MR_DOMAIN}_${YYYY}-${MM}-${DD}_${HH}:00:00.${CMEM}
      ncks -A ${WRFCHEM_MET_IC_DIR}/${WRFINPEN} ${WRFINPEN}
#      ncks -A ${EXPERIMENT_DUST_DIR}/EROD_d${MR_DOMAIN} ${WRFINPEN}
#
# COMBINE WRFCHEM WITH WRF FR DOMAIN
      export WRFINPEN=wrfinput_d${FR_DOMAIN}_${YYYY}-${MM}-${DD}_${HH}:00:00.${CMEM}
      ncks -A ${WRFCHEM_MET_IC_DIR}/${WRFINPEN} ${WRFINPEN}
#      ncks -A ${EXPERIMENT_DUST_DIR}/EROD_d${FR_DOMAIN} ${WRFINPEN}

      let MEM=MEM+1
   done
fi
#
#########################################################################
#
# RUN WRFCHEM PERTURB EMISSIONS
#
#########################################################################
#
if ${RUN_PERT_WRFCHEM_CHEM_EMISS}; then
   if [[ ! -d ${RUN_DIR}/${DATE}/wrfchem_chem_emiss ]]; then
      mkdir -p ${RUN_DIR}/${DATE}/wrfchem_chem_emiss
      cd ${RUN_DIR}/${DATE}/wrfchem_chem_emiss
   else
      cd ${RUN_DIR}/${DATE}/wrfchem_chem_emiss
   fi
#
# SET PARAMETERS
   export EMISS_FREQ=1
   export NL_SPREAD_CHEMI=${SPREAD_FAC}
   export NL_SPREAD_FIRE=0.00
   export NL_SPREAD_BIOG=0.00
   export NL_CORR_HALF_WIDTH=800.
#
# COPY PERTURBATION CODE
   if [[ -e perturb_chem_emiss_CORR_RT_CONST.exe ]]; then 
      rm -rf perturb_chem_emiss_CORR_RT_CONST.exe
   fi
   cp ${PERT_CHEM_EMISS_DIR}/work/perturb_chem_emiss_CORR_RT_CONST.exe ./.
#
#   if [[ -e perturb_chem_emiss_CORR_RT_MA.exe ]]; then 
#      rm -rf perturb_chem_emiss_CORR_RT_MA.exe
#   fi
#   cp ${PERT_CHEM_EMISS_DIR}/perturb_chem_emiss_CORR_RT_MA.exe ./.
#
   export L_DATE=${DATE}
   export LE_DATE=$(${BUILD_DIR}/da_advance_time.exe ${L_DATE} ${FCST_PERIOD} 2>/dev/null)
   while [[ ${L_DATE} -le ${LE_DATE} ]] ; do
      export L_YYYY=$(echo $L_DATE | cut -c1-4)
      export L_MM=$(echo $L_DATE | cut -c5-6)
      export L_DD=$(echo $L_DATE | cut -c7-8)
      export L_HH=$(echo $L_DATE | cut -c9-10)
      export NL_PERT_CHEM=true
      export NL_PERT_FIRE=false
      export NL_PERT_BIO=false
#
# generate emissions perturbation 
      export NL_SW_GENERATE=false
      if [[ ${DATE} -eq ${INITIAL_DATE} && ${PERT_CHEM_GENER} == true ]]; then export NL_SW_GENERATE=true; fi
#
#----------------------------------------------------------------------
# GET COARSE GRID EMISSON FILES
      export WRFCHEMI=wrfchemi_d${CR_DOMAIN}_${L_YYYY}-${L_MM}-${L_DD}_${L_HH}:00:00
      export WRFFIRECHEMI=wrffirechemi_d${CR_DOMAIN}_${L_YYYY}-${L_MM}-${L_DD}_${L_HH}:00:00
      export WRFBIOCHEMI=wrfbiochemi_d${CR_DOMAIN}_${L_YYYY}-${L_MM}-${L_DD}_${L_HH}:00:00
      export WRFINPUT=wrfinput_d${CR_DOMAIN}_${YYYY}-${MM}-${DD}_${HH}:00:00
      export WRFINPUT_DIR=${WRFCHEM_CHEM_ICBC_DIR}
      cp ${WRFINPUT_DIR}/${WRFINPUT} wrfinput_d${CR_DOMAIN}
      let MEM=1
      while [[ ${MEM} -le ${NUM_MEMBERS} ]]; do
         export CMEM=e${MEM}
         if [[ ${MEM} -lt 100 ]]; then export CMEM=e0${MEM}; fi
         if [[ ${MEM} -lt 10  ]]; then export CMEM=e00${MEM}; fi
#
# wrfchemi
         rm -rf ${WRFCHEMI}.${CMEM}
         cp ${WRFCHEM_CHEMI_DIR}/${WRFCHEMI} ${WRFCHEMI}.${CMEM}
         chmod a+rwx ${WRFCHEMI}.${CMEM}
         ncatted -O -a coordinates,E_CO,c,c,"XLONG, XLAT" ${WRFCHEMI}.${CMEM}
         ncatted -O -a coordinates,E_NO,c,c,"XLONG, XLAT" ${WRFCHEMI}.${CMEM}
#
# wrffire
         rm -rf ${WRFFIRECHEMI}.${CMEM}
         cp ${WRFCHEM_FIRE_DIR}/${WRFFIRECHEMI} ${WRFFIRECHEMI}.${CMEM}
         chmod a+rwx ${WRFCHEMI}.${CMEM}
         ncatted -O -a coordinates,ebu_in_co,c,c,"XLONG, XLAT" ${WRFFIRECHEMI}.${CMEM}
         ncatted -O -a coordinates,ebu_in_no,c,c,"XLONG, XLAT" ${WRFFIRECHEMI}.${CMEM}
         ncatted -O -a coordinates,ebu_in_oc,c,c,"XLONG, XLAT" ${WRFFIRECHEMI}.${CMEM}
         ncatted -O -a coordinates,ebu_in_bc,c,c,"XLONG, XLAT" ${WRFFIRECHEMI}.${CMEM}
         ncatted -O -a coordinates,ebu_in_c2h4,c,c,"XLONG, XLAT" ${WRFFIRECHEMI}.${CMEM}
         ncatted -O -a coordinates,ebu_in_ch2o,c,c,"XLONG, XLAT" ${WRFFIRECHEMI}.${CMEM}
         ncatted -O -a coordinates,ebu_in_ch3oh,c,c,"XLONG, XLAT" ${WRFFIRECHEMI}.${CMEM}
#
# wrfbio
         rm -rf ${WRFBIOCHEMI}.${CMEM}
         cp ${WRFCHEM_BIO_DIR}/${WRFBIOCHEMI} ${WRFBIOCHEMI}.${CMEM}
         chmod a+rwx ${WRFCHEMI}.${CMEM}
         let MEM=MEM+1
      done
#
# CREATE NAMELIST
      rm -rf perturb_chem_emiss_CORR_nml.nl
      cat << EOF > perturb_chem_emiss_CORR_nml.nl
&perturb_chem_emiss_CORR_nml
nx=${NNXP_CR},
ny=${NNYP_CR},
nz=${NNZP_CR},
nz_chem=${NNZ_CHEM},
nchem_spc=${NNCHEM_SPC},
nfire_spc=${NNFIRE_SPC},
nbio_spc=${NNBIO_SPC},
pert_path='${RUN_DIR}',
nnum_mem=${NUM_MEMBERS},
wrfinput='wrfinput_d${CR_DOMAIN}',
wrfchemi='${WRFCHEMI}',
wrffirechemi='${WRFFIRECHEMI}',
wrfbiochemi='${WRFBIOCHEMI}',
sprd_chem=${NL_SPREAD_CHEMI},
sprd_fire=${NL_SPREAD_FIRE},
sprd_biog=${NL_SPREAD_BIOG},
sw_gen=${NL_SW_GENERATE},
sw_chem=${NL_PERT_CHEM},
sw_fire=${NL_PERT_FIRE},
sw_biog=${NL_PERT_BIO},
/
EOF
      rm -rf perturb_emiss_chem_spec_nml.nl
# MOZART CHEMICAL SPECIESE
#ch_chem_spc='E_CO','E_NO','E_NO2','E_SO2','E_BIGALK','E_C2H4','E_C2H5OH','E_C2H6','E_C3H6','E_C3H8','E_CH2O','E_CH3CHO','E_BIGENE','E_CH3COCH3','E_CH3OH','E_MEK','E_TOLUENE','E_ISOP','E_C10H16','E_NH3','E_OC','E_BC','E_PM_10','E_PM_25',
# RADM2 chemical speciese
      cat << EOF > perturb_emiss_chem_spec_nml.nl
&perturb_chem_emiss_spec_nml
ch_chem_spc='E_ISO','E_SO2','E_NO','E_NO2','E_CO','E_ETH','E_HC3','E_HC5','E_HC8','E_XYL','E_OL2','E_OLT','E_OLI','E_TOL','E_CSL','E_HCHO','E_ALD','E_KET','E_ORA2','E_NH3','E_PM25I','E_PM25J','E_PM_10','E_ECI','E_ECJ','E_ORGI','E_ORGJ','E_SO4I','E_SO4J','E_NO3I','E_NO3J','E_NAAJ','E_NAAI','E_ORGI_A','E_ORGJ_A','E_ORGI_BB','E_ORGI_BB',
ch_fire_spc='ebu_in_co','ebu_in_no','ebu_in_so2','ebu_in_bigalk','ebu_in_bigene','ebu_in_c2h4','ebu_in_c2h5oh','ebu_in_c2h6','ebu_in_c3h8','ebu_in_c3h6','ebu_in_ch2o','ebu_in_ch3cho','ebu_in_ch3coch3','ebu_in_ch3oh','ebu_in_mek','ebu_in_toluene','ebu_in_nh3','ebu_in_no2','ebu_in_open','ebu_in_c10h16','ebu_in_ch3cooh','ebu_in_cres','ebu_in_glyald','ebu_in_mgly','ebu_in_gly','ebu_in_acetol','ebu_in_isop','ebu_in_macr','ebu_in_mvk','ebu_in_oc','ebu_in_bc',
ch_bio_spc='MSEBIO_ISOP',
/
EOF
      RANDOM=$$
      export JOBRND=${RANDOM}_cr_emiss_pert
      ${HYBRID_SCRIPTS_DIR}/job_script_taki.ksh ${JOBRND} ${GENERAL_JOB_CLASS} ${GENERAL_TIME_LIMIT} ${GENERAL_NODES} ${GENERAL_TASKS} perturb_chem_emiss_CORR_RT_CONST.exe SERIAL
      sbatch -W job.ksh
#
#----------------------------------------------------------------------
# GET MEDIUM GRID EMISSON FILES FOR THIS MEMBER
      export WRFCHEMI=wrfchemi_d${MR_DOMAIN}_${L_YYYY}-${L_MM}-${L_DD}_${L_HH}:00:00
      export WRFFIRECHEMI=wrffirechemi_d${MR_DOMAIN}_${L_YYYY}-${L_MM}-${L_DD}_${L_HH}:00:00
      export WRFBIOCHEMI=wrfbiochemi_d${MR_DOMAIN}_${L_YYYY}-${L_MM}-${L_DD}_${L_HH}:00:00
      export WRFINPUT=wrfinput_d${MR_DOMAIN}_${YYYY}-${MM}-${DD}_${HH}:00:00

      export WRFINPUT_DIR=${WRFCHEM_CHEM_ICBC_DIR}
      cp ${WRFINPUT_DIR}/${WRFINPUT} wrfinput_d${MR_DOMAIN}

      let MEM=1
      while [[ ${MEM} -le ${NUM_MEMBERS} ]]; do
         export CMEM=e${MEM}
         if [[ ${MEM} -lt 100 ]]; then export CMEM=e0${MEM}; fi
         if [[ ${MEM} -lt 10  ]]; then export CMEM=e00${MEM}; fi
         cp ${WRFCHEM_CHEMI_DIR}/${WRFCHEMI} ${WRFCHEMI}.${CMEM}
         cp ${WRFCHEM_FIRE_DIR}/${WRFFIRECHEMI} ${WRFFIRECHEMI}.${CMEM}
         cp ${WRFCHEM_BIO_DIR}/${WRFBIOCHEMI} ${WRFBIOCHEMI}.${CMEM}
         let MEM=MEM+1
      done

 CREATE NAMELIST
      rm -rf perturb_chem_emiss_CORR_nml.nl
      cat << EOF > perturb_chem_emiss_CORR_nml.nl
&perturb_chem_emiss_CORR_nml
nx=${NNXP_MR},
ny=${NNYP_MR},
nz=${NNZP_MR},
nz_chem=${NNZ_CHEM},
nchem_spc=${NNCHEM_SPC},
nfire_spc=${NNFIRE_SPC},
nbio_spc=${NNBIO_SPC},
pert_path='${RUN_DIR}',
nnum_mem=${NUM_MEMBERS},
wrfinput='wrfinput_d${MR_DOMAIN}',
wrfchemi='${WRFCHEMI}',
wrffirechemi='${WRFFIRECHEMI}',
wrfbiochemi='${WRFBIOCHEMI}',
sprd_chem=${NL_SPREAD_CHEMI},
sprd_fire=${NL_SPREAD_FIRE},
sprd_biog=${NL_SPREAD_BIOG},
sw_gen=${NL_SW_GENERATE},
sw_chem=${NL_PERT_CHEM},
sw_fire=${NL_PERT_FIRE},
sw_biog=${NL_PERT_BIO},
/
EOF
      rm -rf perturb_emiss_chem_spec_nml.nl
# MOZART CHEMICAL SPECIESE
#&perturb_chem_emiss_spec_nml
#ch_chem_spc='E_CO','E_NO','E_NO2','E_BIGALK','E_BIGENE','E_C2H4','E_C2H5OH','E_C2H6','E_C3H6','E_C3H8','E_CH2O','E_CH3CHO','E_CH3COCH3','E_CH3OH','E_MEK','E_SO2','E_TOLUENE','E_NH3','E_ISOP','E_C10H16','E_sulf','E_CO_A','E_CO_BB','E_COO2','E_COO3','E_XNO','E_XNO2','E_PM25I','E_PM25J','E_PM_10','E_ECI','E_ECJ','E_ORGI',E_ORGJ','E_SO4I','E_SO4J','E_NO3I','E_NO3J','E_NH4I','E_NH4J','E_PM_25','E_OC','E_BC','E_BALD','E_C2H2','E_BENZENE','E_XYLENE','E_CRES','E_HONO',
# RADM2 chemical speciese
      cat << EOF > perturb_emiss_chem_spec_nml.nl
&perturb_chem_emiss_spec_nml
ch_chem_spc='E_ISO','E_SO2','E_NO','E_NO2','E_CO','E_ETH','E_HC3','E_HC5','E_HC8','E_XYL','E_OL2','E_OLT','E_OLI','E_TOL','E_CSL','E_HCHO','E_ALD','E_KET','E_ORA2','E_NH3','E_PM25I','E_PM25J','E_PM_10','E_ECI','E_ECJ','E_ORGI','E_ORGJ','E_SO4I','E_SO4J','E_NO3I','E_NO3J','E_NAAJ','E_NAAI','E_ORGI_A','E_ORGJ_A','E_ORGI_BB','E_ORGI_BB',
ch_fire_spc='ebu_in_co','ebu_in_no','ebu_in_so2','ebu_in_bigalk','ebu_in_bigene','ebu_in_c2h4','ebu_in_c2h5oh','ebu_in_c2h6','ebu_in_c3h8','ebu_in_c3h6','ebu_in_ch2o','ebu_in_ch3cho','ebu_in_ch3coch3','ebu_in_ch3oh','ebu_in_mek','ebu_in_toluene','ebu_in_nh3','ebu_in_no2','ebu_in_open','ebu_in_c10h16','ebu_in_ch3cooh','ebu_in_cres','ebu_in_glyald','ebu_in_mgly','ebu_in_gly','ebu_in_acetol','ebu_in_isop','ebu_in_macr','ebu_in_mvk','ebu_in_oc','ebu_in_bc',
ch_bio_spc='MSEBIO_ISOP',
/
EOF

   RANDOM=$$
   export JOBRND=${RANDOM}_mr_emiss_pert
   ${HYBRID_SCRIPTS_DIR}/job_script_taki.ksh ${JOBRND} ${GENERAL_JOB_CLASS} ${GENERAL_TIME_LIMIT} ${GENERAL_NODES} ${GENERAL_TASKS} perturb_chem_emiss_CORR_RT_CONST.exe SERIAL
   sbatch -W job.ksh
#
#----------------------------------------------------------------------
# GET FINE GRID EMISSON FILES FOR THIS MEMBER
      export WRFCHEMI=wrfchemi_d${FR_DOMAIN}_${L_YYYY}-${L_MM}-${L_DD}_${L_HH}:00:00
      export WRFFIRECHEMI=wrffirechemi_d${FR_DOMAIN}_${L_YYYY}-${L_MM}-${L_DD}_${L_HH}:00:00
      export WRFBIOCHEMI=wrfbiochemi_d${FR_DOMAIN}_${L_YYYY}-${L_MM}-${L_DD}_${L_HH}:00:00
      export WRFINPUT=wrfinput_d${FR_DOMAIN}_${YYYY}-${MM}-${DD}_${HH}:00:00

      export WRFINPUT_DIR=${WRFCHEM_CHEM_ICBC_DIR}
      cp ${WRFINPUT_DIR}/${WRFINPUT} wrfinput_d${FR_DOMAIN}

      let MEM=1
      while [[ ${MEM} -le ${NUM_MEMBERS} ]]; do
         export CMEM=e${MEM}
         if [[ ${MEM} -lt 100 ]]; then export CMEM=e0${MEM}; fi
         if [[ ${MEM} -lt 10  ]]; then export CMEM=e00${MEM}; fi
         cp ${WRFCHEM_CHEMI_DIR}/${WRFCHEMI} ${WRFCHEMI}.${CMEM}
         cp ${WRFCHEM_FIRE_DIR}/${WRFFIRECHEMI} ${WRFFIRECHEMI}.${CMEM}
         cp ${WRFCHEM_BIO_DIR}/${WRFBIOCHEMI} ${WRFBIOCHEMI}.${CMEM}
         let MEM=MEM+1
      done

 CREATE NAMELIST
      rm -rf perturb_chem_emiss_CORR_nml.nl
      cat << EOF > perturb_chem_emiss_CORR_nml.nl
&perturb_chem_emiss_CORR_nml
nx=${NNXP_FR},
ny=${NNYP_FR},
nz=${NNZP_FR},
nz_chem=${NNZ_CHEM},
nchem_spc=${NNCHEM_SPC},
nfire_spc=${NNFIRE_SPC},
nbio_spc=${NNBIO_SPC},
pert_path='${RUN_DIR}',
nnum_mem=${NUM_MEMBERS},
wrfinput='wrfinput_d${FR_DOMAIN}',
wrfchemi='${WRFCHEMI}',
wrffirechemi='${WRFFIRECHEMI}',
wrfbiochemi='${WRFBIOCHEMI}',
sprd_chem=${NL_SPREAD_CHEMI},
sprd_fire=${NL_SPREAD_FIRE},
sprd_biog=${NL_SPREAD_BIOG},
sw_gen=${NL_SW_GENERATE},
sw_chem=${NL_PERT_CHEM},
sw_fire=${NL_PERT_FIRE},
sw_biog=${NL_PERT_BIO},
/
EOF
      rm -rf perturb_emiss_chem_spec_nml.nl
# MOZART CHEMICAL SPECIESE
#&perturb_chem_emiss_spec_nml
#ch_chem_spc='E_CO','E_NO','E_NO2','E_BIGALK','E_BIGENE','E_C2H4','E_C2H5OH','E_C2H6','E_C3H6','E_C3H8','E_CH2O','E_CH3CHO','E_CH3COCH3','E_CH3OH','E_MEK','E_SO2','E_TOLUENE','E_NH3','E_ISOP','E_C10H16','E_sulf','E_CO_A','E_CO_BB','E_COO2','E_COO3','E_XNO','E_XNO2','E_PM25I','E_PM25J','E_PM_10','E_ECI','E_ECJ','E_ORGI',E_ORGJ','E_SO4I','E_SO4J','E_NO3I','E_NO3J','E_NH4I','E_NH4J','E_PM_25','E_OC','E_BC','E_BALD','E_C2H2','E_BENZENE','E_XYLENE','E_CRES','E_HONO',
# RADM2 chemical speciese
      cat << EOF > perturb_emiss_chem_spec_nml.nl
&perturb_chem_emiss_spec_nml
ch_chem_spc='E_ISO','E_SO2','E_NO','E_NO2','E_CO','E_ETH','E_HC3','E_HC5','E_HC8','E_XYL','E_OL2','E_OLT','E_OLI','E_TOL','E_CSL','E_HCHO','E_ALD','E_KET','E_ORA2','E_NH3','E_PM25I','E_PM25J','E_PM_10','E_ECI','E_ECJ','E_ORGI','E_ORGJ','E_SO4I','E_SO4J','E_NO3I','E_NO3J','E_NAAJ','E_NAAI','E_ORGI_A','E_ORGJ_A','E_ORGI_BB','E_ORGI_BB',
ch_fire_spc='ebu_in_co','ebu_in_no','ebu_in_so2','ebu_in_bigalk','ebu_in_bigene','ebu_in_c2h4','ebu_in_c2h5oh','ebu_in_c2h6','ebu_in_c3h8','ebu_in_c3h6','ebu_in_ch2o','ebu_in_ch3cho','ebu_in_ch3coch3','ebu_in_ch3oh','ebu_in_mek','ebu_in_toluene','ebu_in_nh3','ebu_in_no2','ebu_in_open','ebu_in_c10h16','ebu_in_ch3cooh','ebu_in_cres','ebu_in_glyald','ebu_in_mgly','ebu_in_gly','ebu_in_acetol','ebu_in_isop','ebu_in_macr','ebu_in_mvk','ebu_in_oc','ebu_in_bc',
ch_bio_spc='MSEBIO_ISOP',
/
EOF

   RANDOM=$$
   export JOBRND=${RANDOM}_fr_emiss_pert
   ${HYBRID_SCRIPTS_DIR}/job_script_taki.ksh ${JOBRND} ${GENERAL_JOB_CLASS} ${GENERAL_TIME_LIMIT} ${GENERAL_NODES} ${GENERAL_TASKS} perturb_chem_emiss_CORR_RT_CONST.exe SERIAL
   sbatch -W job.ksh
#

#
# ADVANCE TIME
      export L_DATE=$(${BUILD_DIR}/da_advance_time.exe ${L_DATE} 1 2>/dev/null)
   done #L_DATE
#
   rm -rf wrfchemi_d${CR_DOMAIN}_tmp*
   rm -rf wrfchemi_d${MR_DOMAIN}_tmp*
   rm -rf wrfchemi_d${FR_DOMAIN}_tmp*
   ncecat -n ${NUM_MEMBERS},3,1 wrfchemi_d${CR_DOMAIN}_${FILE_DATE}.e001 wrfchemi_d${CR_DOMAIN}_tmp1
   ncecat -n ${NUM_MEMBERS},3,1 wrfchemi_d${MR_DOMAIN}_${FILE_DATE}.e001 wrfchemi_d${MR_DOMAIN}_tmp1
   ncecat -n ${NUM_MEMBERS},3,1 wrfchemi_d${FR_DOMAIN}_${FILE_DATE}.e001 wrfchemi_d${FR_DOMAIN}_tmp1
   ncwa -O -a record wrfchemi_d${CR_DOMAIN}_tmp1 wrfchemi_d${CR_DOMAIN}_mean
   ncwa -O -a record wrfchemi_d${MR_DOMAIN}_tmp1 wrfchemi_d${MR_DOMAIN}_mean
   ncwa -O -a record wrfchemi_d${FR_DOMAIN}_tmp1 wrfchemi_d${FR_DOMAIN}_mean
   ncbo --op_typ='-' wrfchemi_d${CR_DOMAIN}_tmp1 wrfchemi_d${CR_DOMAIN}_mean wrfchemi_d${CR_DOMAIN}_tmp3
   ncbo --op_typ='-' wrfchemi_d${MR_DOMAIN}_tmp1 wrfchemi_d${MR_DOMAIN}_mean wrfchemi_d${MR_DOMAIN}_tmp3
   ncbo --op_typ='-' wrfchemi_d${FR_DOMAIN}_tmp1 wrfchemi_d${FR_DOMAIN}_mean wrfchemi_d${FR_DOMAIN}_tmp3
   ncra -O -y rmssdn wrfchemi_d${CR_DOMAIN}_tmp3 wrfchemi_d${CR_DOMAIN}_sprd
   ncra -O -y rmssdn wrfchemi_d${MR_DOMAIN}_tmp3 wrfchemi_d${MR_DOMAIN}_sprd
   ncra -O -y rmssdn wrfchemi_d${FR_DOMAIN}_tmp3 wrfchemi_d${FR_DOMAIN}_sprd
   rm -rf wrfchemi_d${CR_DOMAIN}_tmp*
   rm -rf wrfchemi_d${MR_DOMAIN}_tmp*
   rm -rf wrfchemi_d${FR_DOMAIN}_tmp*
fi
#
#########################################################################
#
# RUN AIRNOW O3 OBSERVATIONS
#
#########################################################################
#
if ${RUN_AIRNOW_O3_OBS}; then
   if [[ ! -d ${RUN_DIR}/${DATE}/airnow_o3_obs ]]; then
      mkdir -p ${RUN_DIR}/${DATE}/airnow_o3_obs
      cd ${RUN_DIR}/${DATE}/airnow_o3_obs
   else
      cd ${RUN_DIR}/${DATE}/airnow_o3_obs
   fi
#
# GET AIRNOW DATA
   if [[ ! -e airnow_o3_hourly_csv_data ]]; then
      cp ${EXPERIMENT_AIRNOW_DIR}/hourly_44201_2015.csv ./.
   fi
#
   export ASIM_MIN_MN=0
   export ASIM_MIN_SS=1
   export ASIM_MAX_MN=0
   export ASIM_MAX_SS=0
#
# RUN_AIRNOW_O3_ASCII_TO_DART
   if [[ ${HH} -eq 0 ]]; then
      export L_YYYY=${ASIM_MIN_YYYY}
      export L_MM=${ASIM_MIN_MM}
      export L_DD=${ASIM_MIN_DD}
      export L_HH=24
      export D_DATE=${L_YYYY}${L_MM}${L_DD}${L_HH}
   else
      export L_YYYY=${YYYY}
      export L_MM=${MM}
      export L_DD=${DD}
      export L_HH=${HH}
      export D_DATE=${L_YYYY}${L_MM}${L_DD}${L_HH}
   fi
   export NL_YEAR=${L_YYYY}
   export NL_MONTH=${L_MM}
   export NL_DAY=${L_DD}
   export NL_HOUR=${L_HH}
#
   export NL_FILENAME=\'hourly_44201_2015.csv\'
   export NL_LAT_MN=${NL_MIN_LAT}
   export NL_LAT_MX=${NL_MAX_LAT}
   export NL_LON_MN=${NNL_MIN_LON}
   export NL_LON_MX=${NNL_MAX_LON}
   export NL_USE_LOG_CO=${USE_LOG_CO_LOGIC}
   export NL_USE_LOG_O3=${USE_LOG_O3_LOGIC}
#
# GET EXECUTABLE
   cp ${DART_DIR}/observations/AIRNOW/work/airnow_o3_ascii_to_obs ./.
   rm -rf create_airnow_obs_nml.nl
   rm -rf input.nml
   ${HYBRID_SCRIPTS_DIR}/da_create_dart_airnow_input_nml.ksh
   ./airnow_o3_ascii_to_obs > index.file 2>&1
#
# COPY OUTPUT TO ARCHIVE LOCATION
   export AIRNOW_OUT_FILE=airnow_obs_seq
   export AIRNOW_ARCH_FILE=obs_seq_airnow_o3_${DATE}.out
   if [[ -s ${AIRNOW_OUT_FILE} ]]; then
      cp ${AIRNOW_OUT_FILE} ${AIRNOW_ARCH_FILE}
      rm ${AIRNOW_OUT_FILE}
   else
      touch NO_DATA_${D_DATE}
   fi     
fi
#
#########################################################################
#
# RUN TOLNET O3 OBSERVATIONS (TEXT)
#
#########################################################################
#
if ${RUN_TOLNET_O3_OBS}; then
   if [[ ! -d ${RUN_DIR}/${DATE}/tolnet_o3_obs ]]; then
      mkdir -p ${RUN_DIR}/${DATE}/tolnet_o3_obs
      cd ${RUN_DIR}/${DATE}/tolnet_o3_obs
   else
      cd ${RUN_DIR}/${DATE}/tolnet_o3_obs
   fi
#
# GET TOLNET DATA
   cp ${EXPERIMENT_TOLNET_DIR}/TOLNet-O3Lidar_HUBV_* ./.
#
   export ASIM_MIN_MN=0
   export ASIM_MIN_SS=1
   export ASIM_MAX_MN=0
   export ASIM_MAX_SS=0
#
# RUN_TOLNET_O3_ASCII_TO_DART
   if [[ ${HH} -eq 0 ]]; then
      export L_YYYY=${ASIM_MIN_YYYY}
      export L_MM=${ASIM_MIN_MM}
      ((L_DD=${ASIM_MIN_DD}+1))
      export L_HH=${HH}
      export D_DATE=${L_YYYY}${L_MM}${L_DD}${L_HH}
   else
      export L_YYYY=${YYYY}
      export L_MM=${MM}
      export L_DD=${DD}
      export L_HH=${HH}
      export D_DATE=${L_YYYY}${L_MM}${L_DD}${L_HH}
   fi
   export NL_YEAR=${L_YYYY}
   export NL_MONTH=${L_MM}
   export NL_DAY=${L_DD}
   export NL_HOUR=${L_HH}
#
   export NL_FILE_PREFIX=\'TOLNet-O3Lidar_HUBV_\'
   export NL_FILE_POSTFIX=\'_R0.dat\'
   export NL_LAT_MN=${NL_MIN_LAT}
   export NL_LAT_MX=${NL_MAX_LAT}
   export NL_LON_MN=${NNL_MIN_LON}
   export NL_LON_MX=${NNL_MAX_LON}
   export NL_USE_LOG_O3=${USE_LOG_O3_LOGIC}
#
# GET EXECUTABLE
   cp ${DART_DIR}/observations/TOLNET/work/tolnet_o3_ascii_to_obs ./.
   rm -rf create_tolnet_obs_nml.nl
   rm -rf input.nml
   ${HYBRID_SCRIPTS_DIR}/da_create_dart_tolnet_input_nml.ksh
   ./tolnet_o3_ascii_to_obs > index.file 2>&1
#
# COPY OUTPUT TO ARCHIVE LOCATION
   export TOLNET_OUT_FILE=tolnet_obs_seq
   export TOLNET_ARCH_FILE=obs_seq_tolnet_o3_${DATE}.out
   if [[ -s ${TOLNET_OUT_FILE} ]]; then
      cp ${TOLNET_OUT_FILE} ${TOLNET_ARCH_FILE}
      rm ${TOLNET_OUT_FILE}
   else
      touch NO_DATA_${D_DATE}
   fi
fi
#
#########################################################################
#
# RUN PREPBUFR MET OBSERVATIONS
#
#########################################################################
#
# APM: This block needs to be revised so we can convert a single prepbufr
#      file in real time we can use only the obs that are on the current
#      prepbufr file.
#
if ${RUN_MET_OBS}; then
   if [[ ! -d ${RUN_DIR}/${DATE}/prepbufr_met_obs ]]; then
      mkdir -p ${RUN_DIR}/${DATE}/prepbufr_met_obs
      cd ${RUN_DIR}/${DATE}/prepbufr_met_obs
   else
      cd ${RUN_DIR}/${DATE}/prepbufr_met_obs
   fi
#
# GET PREPBUFR FILES
#           
   export L_DATE=${D_YYYY}${D_MM}${D_DD}06
   export E_DATE=$(${BUILD_DIR}/da_advance_time.exe ${L_DATE} +24 2>/dev/null)
   while [[ ${L_DATE} -le ${E_DATE} ]]; do
      export L_YYYY=$(echo $L_DATE | cut -c1-4)
      export L_YY=$(echo $L_DATE | cut -c3-4)
      export L_MM=$(echo $L_DATE | cut -c5-6)
      export L_DD=$(echo $L_DATE | cut -c7-8)
      export L_HH=$(echo $L_DATE | cut -c9-10)
      cp ${EXPERIMENT_PREPBUFR_DIR}/prepbufr.gdas.${L_YYYY}${L_MM}${L_DD}.t${L_HH}z.nr prepqm${L_YY}${L_MM}${L_DD}${L_HH}
      export L_DATE=$(${BUILD_DIR}/da_advance_time.exe ${L_DATE} +6 2>/dev/null)
   done
#
# GET DART input.nml
   rm -rf input.nml
   cp ${DART_DIR}/observations/NCEP/prep_bufr/work/input.nml ./.
#
# RUN_PREPBUFR TO ASCII CONVERTER
   ${DART_DIR}/observations/NCEP/prep_bufr/work/prepbufr_RT.csh ${D_YYYY} ${DD_MM} ${DD_DD} ${DD_DD} ${DART_DIR}/observations/NCEP/prep_bufr/exe > index.file 2>&1
#
# RUN ASCII TO OBS_SEQ CONVERTER
   ${HYBRID_SCRIPTS_DIR}/da_create_dart_ncep_ascii_to_obs_input_nml_RT.ksh
   ${DART_DIR}/observations/NCEP/ascii_to_obs/work/create_real_obs > index_create 2>&1
#
   mv obs_seq${D_DATE} obs_seq_prep_${DATE}.out
fi
#
#########################################################################
#
# RUN COMBINE OBSERVATIONS
#
#########################################################################
#
if ${RUN_COMBINE_OBS}; then
   if [[ ! -d ${RUN_DIR}/${DATE}/combine_obs ]]; then
      mkdir -p ${RUN_DIR}/${DATE}/combine_obs
      cd ${RUN_DIR}/${DATE}/combine_obs
   else
      cd ${RUN_DIR}/${DATE}/combine_obs
   fi
#
# GET EXECUTABLES
   cp ${DART_DIR}/models/wrf_chem/work/obs_sequence_tool ./.
   export NUM_FILES=0
#
# GET OBS_SEQ FILES TO COMBINE
# MET OBS
   if [[ -s ${PREPBUFR_MET_OBS_DIR}/obs_seq_prep_${DATE}.out && ${RUN_MET_OBS} ]]; then 
      (( NUM_FILES=${NUM_FILES}+1 ))
      cp ${PREPBUFR_MET_OBS_DIR}/obs_seq_prep_${DATE}.out ./obs_seq_MET_${DATE}.out
      export FILE_LIST[${NUM_FILES}]=obs_seq_MET_${DATE}.out
   fi
#

# AIRNOW O3
   if [[ -s ${AIRNOW_O3_OBS_DIR}/obs_seq_airnow_o3_${DATE}.out && ${RUN_AIRNOW_O3_OBS} ]]; then 
      cp ${AIRNOW_O3_OBS_DIR}/obs_seq_airnow_o3_${DATE}.out ./obs_seq_AIR_O3_${DATE}.out   
      (( NUM_FILES=${NUM_FILES}+1 ))
      export FILE_LIST[${NUM_FILES}]=obs_seq_AIR_O3_${DATE}.out
   fi
#

# TOLNET O3
   if [[ -s ${TOLNET_O3_OBS_DIR}/obs_seq_tolnet_o3_${DATE}.out && ${RUN_TOLNET_O3_OBS} ]]; then
      cp ${TOLNET_O3_OBS_DIR}/obs_seq_tolnet_o3_${DATE}.out ./obs_seq_TOL_O3_${DATE}.out
      (( NUM_FILES=${NUM_FILES}+1 ))
      export FILE_LIST[${NUM_FILES}]=obs_seq_TOL_O3_${DATE}.out
   fi
#

   export NL_NUM_INPUT_FILES=${NUM_FILES}
#
# All files present
   if [[ ${NL_NUM_INPUT_FILES} -eq 8 ]]; then
      export NL_FILENAME_SEQ=\'${FILE_LIST[1]}\',\'${FILE_LIST[2]}\',\'${FILE_LIST[3]}\',\'${FILE_LIST[4]}\',\'${FILE_LIST[5]}\',\'${FILE_LIST[6]}\',\'${FILE_LIST[7]}\',\'${FILE_LIST[8]}\'
   elif [[ ${NL_NUM_INPUT_FILES} -eq 7 ]]; then
      export NL_FILENAME_SEQ=\'${FILE_LIST[1]}\',\'${FILE_LIST[2]}\',\'${FILE_LIST[3]}\',\'${FILE_LIST[4]}\',\'${FILE_LIST[5]}\',\'${FILE_LIST[6]}\',\'${FILE_LIST[7]}\'
   elif [[ ${NL_NUM_INPUT_FILES} -eq 6 ]]; then
      export NL_FILENAME_SEQ=\'${FILE_LIST[1]}\',\'${FILE_LIST[2]}\',\'${FILE_LIST[3]}\',\'${FILE_LIST[4]}\',\'${FILE_LIST[5]}\',\'${FILE_LIST[6]}\'
   elif [[ ${NL_NUM_INPUT_FILES} -eq 5 ]]; then
      export NL_FILENAME_SEQ=\'${FILE_LIST[1]}\',\'${FILE_LIST[2]}\',\'${FILE_LIST[3]}\',\'${FILE_LIST[4]}\',\'${FILE_LIST[5]}\'
   elif [[ ${NL_NUM_INPUT_FILES} -eq 4 ]]; then
      export NL_FILENAME_SEQ=\'${FILE_LIST[1]}\',\'${FILE_LIST[2]}\',\'${FILE_LIST[3]}\',\'${FILE_LIST[4]}\'
   elif [[ ${NL_NUM_INPUT_FILES} -eq 3 ]]; then
      export NL_FILENAME_SEQ=\'${FILE_LIST[1]}\',\'${FILE_LIST[2]}\',\'${FILE_LIST[3]}\'
   elif [[ ${NL_NUM_INPUT_FILES} -eq 2 ]]; then
      export NL_FILENAME_SEQ=\'${FILE_LIST[1]}\',\'${FILE_LIST[2]}\'
   elif [[ ${NL_NUM_INPUT_FILES} -eq 1 ]]; then
      export NL_FILENAME_SEQ=\'${FILE_LIST[1]}\'
   elif [[ ${NL_NUM_INPUT_FILES} -eq 0 ]]; then
      echo APM: ERROR no obs_seq files for FILTER
      exit
   fi
   export NL_FILENAME_OUT="'obs_seq.proc'"
   export NL_FIRST_OBS_DAYS=${ASIM_MIN_DAY_GREG}
   export NL_FIRST_OBS_SECONDS=${ASIM_MIN_SEC_GREG}
   export NL_LAST_OBS_DAYS=${ASIM_MAX_DAY_GREG}
   export NL_LAST_OBS_SECONDS=${ASIM_MAX_SEC_GREG}
   export NL_SYNONYMOUS_COPY_LIST="'NCEP BUFR observation','MOPITT CO observation','IASI CO observation','IASI O3 observation','AIRNOW observation','TOLNET observation','MODIS observation'"
   export NL_SYNONYMOUS_QC_LIST="'NCEP QC index','MOPITT CO QC index','IASI CO QC index','IASI O3 QC index','AIRNOW QC index','TOLNET QC index','MODIS QC index'"
   rm -rf input.nml
   export NL_MOPITT_CO_RETRIEVAL_TYPE=\'${RETRIEVAL_TYPE_MOPITT}\'
   export NL_IASI_CO_RETRIEVAL_TYPE=\'${RETRIEVAL_TYPE_IASI}\'
   export NL_USE_LOG_CO=${USE_LOG_CO_LOGIC}
   export NL_USE_LOG_O3=${USE_LOG_O3_LOGIC}
   ${HYBRID_SCRIPTS_DIR}/da_create_dart_input_nml.ksh       
#
   ./obs_sequence_tool
   mv obs_seq.proc obs_seq_comb_${DATE}.out
fi
#
#########################################################################
#
# RUN PREPROCESS OBSERVATIONS
#
#########################################################################
#
if ${RUN_PREPROCESS_OBS}; then
   if [[ ! -d ${RUN_DIR}/${DATE}/preprocess_obs ]]; then
      mkdir -p ${RUN_DIR}/${DATE}/preprocess_obs
      cd ${RUN_DIR}/${DATE}/preprocess_obs
   else
      cd ${RUN_DIR}/${DATE}/preprocess_obs
   fi
#
# GET WRFINPUT TEMPLATE
   cp ${WRFCHEM_CHEM_ICBC_DIR}/wrfinput_d${CR_DOMAIN}_${FILE_DATE}.e001 wrfinput_d${CR_DOMAIN}
   cp ${WRFCHEM_CHEM_EMISS_DIR}/wrfbiochemi_d${CR_DOMAIN}_${FILE_DATE}.e001 wrfbiochemi_d${CR_DOMAIN}
   cp ${WRFCHEM_CHEM_EMISS_DIR}/wrffirechemi_d${CR_DOMAIN}_${FILE_DATE}.e001 wrffirechemi_d${CR_DOMAIN}
   cp ${WRFCHEM_CHEM_EMISS_DIR}/wrfchemi_d${CR_DOMAIN}_${FILE_DATE}.e001 wrfchemi_d${CR_DOMAIN}
#
# GET DART UTILITIES
   cp ${DART_DIR}/models/wrf_chem/work/wrf_dart_obs_preprocess ./.
   cp ${DART_DIR}/models/wrf_chem/WRF_DART_utilities/wrf_dart_obs_preprocess.nml ./.
   rm -rf input.nml
   export NL_DEFAULT_STATE_VARIABLES=.true.
   export NL_MOPITT_CO_RETRIEVAL_TYPE=\'${RETRIEVAL_TYPE_MOPITT}\'
   export NL_IASI_CO_RETRIEVAL_TYPE=\'${RETRIEVAL_TYPE_IASI}\'
   export NL_USE_LOG_CO=${USE_LOG_CO_LOGIC}
   export NL_USE_LOG_O3=${USE_LOG_O3_LOGIC}
   ${DART_DIR}/models/wrf_chem/namelist_scripts/DART/dart_create_input.nml.ksh
   export NL_DEFAULT_STATE_VARIABLES=.false.
#
# GET INPUT DATA
   rm -rf obs_seq.old
   rm -rf obs_seq.new
   cp ${COMBINE_OBS_DIR}/obs_seq_comb_${DATE}.out obs_seq.old
#
   rm -rf job.ksh
   touch job.ksh
   RANDOM=$$
   export JOBRND=${RANDOM}_preproc
   cat << EOFF > job.ksh
#!/bin/ksh -aeux
#SBATCH --job-name ${JOBRND}
#SBATCH --qos ${GENERAL_JOB_CLASS}
#SBATCH --time ${GENERAL_TIME_LIMIT}
#SBATCH --output ${JOBRND}.log-%j.out
#SBATCH --nodes ${GENERAL_NODES}
#SBATCH --ntasks ${GENERAL_TASKS}
#SBATCH --partition batch
#
./wrf_dart_obs_preprocess ${DAY_GREG} ${SEC_GREG} > index_html 2>&1 
export RC=\$?     
if [[ -f SUCCESS ]]; then rm -rf SUCCESS; fi     
if [[ -f FAILED ]]; then rm -rf FAILED; fi          
if [[ \$RC = 0 ]]; then
   touch SUCCESS
else
   touch FAILED 
   exit
fi
EOFF
   sbatch -W job.ksh 
#
   mv obs_seq.new obs_seq_comb_filtered_${DATE}.out 
fi
#
#########################################################################
#
# RUN WRF-CHEM INITAL (NO CYCLING-BASED FIRST GUESS FOR DART)
#
#########################################################################
#
if ${RUN_WRFCHEM_INITIAL}; then
   if [[ ! -d ${RUN_DIR}/${DATE}/wrfchem_initial ]]; then
      mkdir -p ${RUN_DIR}/${DATE}/wrfchem_initial
      cd ${RUN_DIR}/${DATE}/wrfchem_initial
   else
      cd ${RUN_DIR}/${DATE}/wrfchem_initial
   fi
#
# Run WRF-Chem for all ensemble members
   TRANDOM=$$
   let IMEM=1
   export L_NUM_MEMBERS=${NUM_MEMBERS}
   if ${RUN_SPECIAL_FORECAST}; then
      export L_NUM_MEMBERS=${NUM_SPECIAL_FORECAST}
   fi
   while [[ ${IMEM} -le ${L_NUM_MEMBERS} ]]; do
      export MEM=${IMEM}
      export NL_TIME_STEP=${NNL_TIME_STEP}
      if ${RUN_SPECIAL_FORECAST}; then
         export MEM=${SPECIAL_FORECAST_MEM[${IMEM}]}
         let NL_TIME_STEP=${NNL_TIME_STEP}*${SPECIAL_FORECAST_FAC}
      fi
      export CMEM=e${MEM}
      export KMEM=${MEM}
      if [[ ${MEM} -lt 1000 ]]; then export KMEM=0${MEM}; fi
      if [[ ${MEM} -lt 100 ]]; then export KMEM=00${MEM}; export CMEM=e0${MEM}; fi
      if [[ ${MEM} -lt 10 ]]; then export KMEM=000${MEM}; export CMEM=e00${MEM}; fi
      export L_RUN_DIR=run_${CMEM}
      cd ${RUN_DIR}/${DATE}/wrfchem_initial
      if ${RUN_SPECIAL_FORECAST}; then
         rm -rf ${L_RUN_DIR}
      fi
      if [[ ! -e ${L_RUN_DIR} ]]; then
         mkdir ${L_RUN_DIR}
         cd ${L_RUN_DIR}
      else
         cd ${L_RUN_DIR}
      fi
#
# Get WRF-Chem parameter files
      cp ${WRFCHEM_DIR}/test/em_real/wrf.exe ./.
      cp ${WRFCHEM_DIR}/test/em_real/aerosol.formatted ./.
      cp ${WRFCHEM_DIR}/test/em_real/aerosol_lat.formatted ./.
      cp ${WRFCHEM_DIR}/test/em_real/aerosol_lon.formatted ./.
      cp ${WRFCHEM_DIR}/test/em_real/aerosol_plev.formatted ./.
      cp ${WRFCHEM_DIR}/test/em_real/bulkdens.asc_s_0_03_0_9 ./.
      cp ${WRFCHEM_DIR}/test/em_real/bulkradii.asc_s_0_03_0_9 ./.
      cp ${WRFCHEM_DIR}/test/em_real/CAM_ABS_DATA ./.
      cp ${WRFCHEM_DIR}/test/em_real/CAM_AEROPT_DATA ./.
      cp ${WRFCHEM_DIR}/test/em_real/CAMtr_volume_mixing_ratio ./.
      cp ${WRFCHEM_DIR}/test/em_real/CAMtr_volume_mixing_ratio.A1B ./.
      cp ${WRFCHEM_DIR}/test/em_real/CAMtr_volume_mixing_ratio.A2 ./.
      cp ${WRFCHEM_DIR}/test/em_real/CAMtr_volume_mixing_ratio.RCP4.5 ./.
      cp ${WRFCHEM_DIR}/test/em_real/CAMtr_volume_mixing_ratio.RCP6 ./.
      cp ${WRFCHEM_DIR}/test/em_real/capacity.asc ./.
      cp ${WRFCHEM_DIR}/test/em_real/CCN_ACTIVATE.BIN ./.
      cp ${WRFCHEM_DIR}/test/em_real/CLM_ALB_ICE_DFS_DATA ./.
      cp ${WRFCHEM_DIR}/test/em_real/CLM_ALB_ICE_DRC_DATA ./.
      cp ${WRFCHEM_DIR}/test/em_real/CLM_ASM_ICE_DFS_DATA ./.
      cp ${WRFCHEM_DIR}/test/em_real/CLM_ASM_ICE_DRC_DATA ./.
      cp ${WRFCHEM_DIR}/test/em_real/CLM_DRDSDT0_DATA ./.
      cp ${WRFCHEM_DIR}/test/em_real/CLM_EXT_ICE_DFS_DATA ./.
      cp ${WRFCHEM_DIR}/test/em_real/CLM_EXT_ICE_DRC_DATA ./.
      cp ${WRFCHEM_DIR}/test/em_real/CLM_KAPPA_DATA ./.
      cp ${WRFCHEM_DIR}/test/em_real/CLM_TAU_DATA ./.
      cp ${WRFCHEM_DIR}/test/em_real/coeff_p.asc ./.
      cp ${WRFCHEM_DIR}/test/em_real/coeff_q.asc ./.
      cp ${WRFCHEM_DIR}/test/em_real/constants.asc ./.
      cp ${WRFCHEM_DIR}/test/em_real/ETAMPNEW_DATA ./.
      cp ${WRFCHEM_DIR}/test/em_real/ETAMPNEW_DATA.expanded_rain ./.
      cp ${WRFCHEM_DIR}/test/em_real/GENPARM.TBL ./.
      cp ${WRFCHEM_DIR}/test/em_real/grib2map.tbl ./.
      cp ${WRFCHEM_DIR}/test/em_real/gribmap.txt ./.
      cp ${WRFCHEM_DIR}/test/em_real/kernels.asc_s_0_03_0_9 ./.
      cp ${WRFCHEM_DIR}/test/em_real/kernels_z.asc ./.
      cp ${WRFCHEM_DIR}/test/em_real/LANDUSE.TBL ./.
      cp ${WRFCHEM_DIR}/test/em_real/masses.asc ./.
      cp ${WRFCHEM_DIR}/test/em_real/MPTABLE.TBL ./.
      cp ${WRFCHEM_DIR}/test/em_real/ozone.formatted ./.
      cp ${WRFCHEM_DIR}/test/em_real/ozone_lat.formatted ./.
      cp ${WRFCHEM_DIR}/test/em_real/ozone_plev.formatted ./.
      cp ${WRFCHEM_DIR}/test/em_real/RRTM_DATA ./.
      cp ${WRFCHEM_DIR}/test/em_real/RRTMG_LW_DATA ./.
      cp ${WRFCHEM_DIR}/test/em_real/RRTMG_SW_DATA ./.
      cp ${WRFCHEM_DIR}/test/em_real/SOILPARM.TBL ./.
      cp ${WRFCHEM_DIR}/test/em_real/termvels.asc ./.
      cp ${WRFCHEM_DIR}/test/em_real/tr49t67 ./.
      cp ${WRFCHEM_DIR}/test/em_real/tr49t85 ./.
      cp ${WRFCHEM_DIR}/test/em_real/tr67t85 ./.
      cp ${WRFCHEM_DIR}/test/em_real/URBPARM.TBL ./.
      cp ${WRFCHEM_DIR}/test/em_real/VEGPARM.TBL ./.
      cp ${EXPERIMENT_HIST_IO_DIR}/hist_io_flds_v1 ./.
      cp ${EXPERIMENT_HIST_IO_DIR}/hist_io_flds_v2 ./.
      cp ${EXPERIMENT_HIST_IO_DIR}/hist_io_flds_v3 ./.
#
      cp ${EXPERIMENT_STATIC_FILES}/clim_p_trop.nc ./.
      cp ${EXPERIMENT_STATIC_FILES}/ubvals_b40.20th.track1_1996-2005.nc ./.
      cp ${EXO_COLDENS_DIR}/exo_coldens_d${CR_DOMAIN} ./.
      cp ${EXO_COLDENS_DIR}/exo_coldens_d${MR_DOMAIN} ./.
      cp ${SEASONS_WES_DIR}/wrf_season_wes_usgs_d${CR_DOMAIN}.nc ./.
      cp ${SEASONS_WES_DIR}/wrf_season_wes_usgs_d${MR_DOMAIN}.nc ./.
#
# Get WRF-Chem emissions files

      export L_DATE=${START_DATE}
      while [[ ${L_DATE} -le ${END_DATE} ]]; do
         export L_YY=`echo ${L_DATE} | cut -c1-4`
         export L_MM=`echo ${L_DATE} | cut -c5-6`
         export L_DD=`echo ${L_DATE} | cut -c7-8`
         export L_HH=`echo ${L_DATE} | cut -c9-10`
         export L_FILE_DATE=${L_YY}-${L_MM}-${L_DD}_${L_HH}:00:00
         cp ${WRFCHEM_CHEM_EMISS_DIR}/wrfbiochemi_d${CR_DOMAIN}_${L_FILE_DATE}.${CMEM} wrfbiochemi_d${CR_DOMAIN}_${L_FILE_DATE}
         cp ${WRFCHEM_CHEM_EMISS_DIR}/wrfbiochemi_d${MR_DOMAIN}_${L_FILE_DATE}.${CMEM} wrfbiochemi_d${MR_DOMAIN}_${L_FILE_DATE}
         cp ${WRFCHEM_CHEM_EMISS_DIR}/wrffirechemi_d${CR_DOMAIN}_${L_FILE_DATE}.${CMEM} wrffirechemi_d${CR_DOMAIN}_${L_FILE_DATE}
         cp ${WRFCHEM_CHEM_EMISS_DIR}/wrffirechemi_d${MR_DOMAIN}_${L_FILE_DATE}.${CMEM} wrffirechemi_d${MR_DOMAIN}_${L_FILE_DATE}
         cp ${WRFCHEM_CHEM_EMISS_DIR}/wrfchemi_d${CR_DOMAIN}_${L_FILE_DATE}.${CMEM} wrfchemi_d${CR_DOMAIN}_${L_FILE_DATE}
         cp ${WRFCHEM_CHEM_EMISS_DIR}/wrfchemi_d${MR_DOMAIN}_${L_FILE_DATE}.${CMEM} wrfchemi_d${MR_DOMAIN}_${L_FILE_DATE}
         export L_DATE=$(${BUILD_DIR}/da_advance_time.exe ${L_DATE} +1 2>/dev/null)
      done
#
# Get WRF-Chem input and bdy files
      cp ${WRFCHEM_CHEM_ICBC_DIR}/wrfinput_d${CR_DOMAIN}_${START_FILE_DATE}.${CMEM} wrfinput_d${CR_DOMAIN}
      cp ${WRFCHEM_CHEM_ICBC_DIR}/wrfinput_d${MR_DOMAIN}_${START_FILE_DATE}.${CMEM} wrfinput_d${MR_DOMAIN}
# ZHIFENG YANG
#     cp ${RUN_DIR}/${DATE}/real/wrfinput_d${CR_DOMAIN}_${START_FILE_DATE} wrfinput_d${CR_DOMAIN}
# ZHIFENG YANG
      cp ${WRFCHEM_CHEM_ICBC_DIR}/wrfbdy_d${CR_DOMAIN}_${START_FILE_DATE}.${CMEM} wrfbdy_d${CR_DOMAIN}
#
# Create WRF-Chem namelist.input
      export NL_MAX_DOM=2
      export NL_IOFIELDS_FILENAME=\'hist_io_flds_v1\',\'hist_io_flds_v2\',\'hist_io_flds_v3\'
      rm -rf namelist.input
      ${HYBRID_SCRIPTS_DIR}/da_create_wrfchem_namelist_RT.ksh
#
      export JOBRND=${TRANDOM}_wrf
      ${HYBRID_SCRIPTS_DIR}/job_script_taki.ksh ${JOBRND} ${WRFCHEM_JOB_CLASS} ${WRFCHEM_TIME_LIMIT} ${WRFCHEM_NODES} ${WRFCHEM_TASKS} wrf.exe PARALLEL
      sbatch job.ksh
      let IMEM=${IMEM}+1
   done
#
# Wait for WRFCHEM to complete for each member
   ${HYBRID_SCRIPTS_DIR}/da_run_hold_taki.ksh ${TRANDOM}
fi
#
#########################################################################
#
# RUN DART_FILTER
#
#########################################################################
#
if ${RUN_DART_FILTER}; then
   if [[ ! -d ${RUN_DIR}/${DATE}/dart_filter ]]; then
      mkdir -p ${RUN_DIR}/${DATE}/dart_filter
      cd ${RUN_DIR}/${DATE}/dart_filter
   else
      cd ${RUN_DIR}/${DATE}/dart_filter
   fi
#
# Get DART files
   cp ${DART_DIR}/models/wrf_chem/work/filter      ./.
   cp ${DART_DIR}/system_simulation/final_full_precomputed_tables/final_full.${NUM_MEMBERS} ./.
   cp ${DART_DIR}/models/wrf_chem/work/advance_time ./.
   cp ${DART_DIR}/models/wrf_chem/work/input.nml ./.
#
# Get background forecasts
   if [[ ${DATE} -eq ${FIRST_FILTER_DATE} ]]; then
      export BACKGND_FCST_DIR=${WRFCHEM_INITIAL_DIR}
   else
      export BACKGND_FCST_DIR=${WRFCHEM_LAST_CYCLE_CR_DIR}
   fi
#
# Get observations
   if [[ ${PREPROCESS_OBS_DIR}/obs_seq_comb_filtered_${START_DATE}.out ]]; then      
      cp  ${PREPROCESS_OBS_DIR}/obs_seq_comb_filtered_${START_DATE}.out obs_seq.out
   else
      echo APM ERROR: NO DART OBSERVATIONS
      exit
   fi
#
# Run WRF_TO_DART
   let MEM=1
   while [[ ${MEM} -le ${NUM_MEMBERS} ]]; do
      export CMEM=e${MEM}
      export KMEM=${MEM}
      if [[ ${MEM} -lt 1000 ]]; then export KMEM=0${MEM}; fi
      if [[ ${MEM} -lt 100 ]]; then export KMEM=00${MEM}; export CMEM=e0${MEM}; fi
      if [[ ${MEM} -lt 10 ]]; then export KMEM=000${MEM}; export CMEM=e00${MEM}; fi
#
      cd ${RUN_DIR}/${DATE}/dart_filter
      rm -rf wrk_wrf_${CMEM}
      mkdir wrk_wrf_${CMEM}
      cd ${RUN_DIR}/${DATE}/dart_filter/wrk_wrf_${CMEM}
#
# &wrf_to_dart_nml
      export NL_DART_RESTART_NAME="'../filter_ic_old.${KMEM}'"
      export NL_PRINT_DATA_RANGES=.false.
      export NL_USE_LOG_CO=${USE_LOG_CO_LOGIC}
      export NL_USE_LOG_O3=${USE_LOG_O3_LOGIC}
      ${DART_DIR}/models/wrf_chem/namelist_scripts/DART/dart_create_input.nml.ksh
      cp ${DART_DIR}/models/wrf_chem/work/wrf_to_dart ./.
##
## APM: +++ 
## For _ALL and emission inversion use wrfout instead of wrfapm because some needed fields 
## are not in wrfapm.  Also copy in the emissions files
      cp ${BACKGND_FCST_DIR}/run_${CMEM}/wrfout_d${CR_DOMAIN}_${FILE_DATE} wrfinput_d${CR_DOMAIN}
      cp ${BACKGND_FCST_DIR}/run_${CMEM}/wrfout_d${CR_DOMAIN}_${FILE_DATE} ../wrfinput_d${CR_DOMAIN}_${CMEM}
#      cp ${BACKGND_FCST_DIR}/run_${CMEM}/wrfapm_d${CR_DOMAIN}_${FILE_DATE} wrfinput_d${CR_DOMAIN}
#      cp ${BACKGND_FCST_DIR}/run_${CMEM}/wrfapm_d${CR_DOMAIN}_${FILE_DATE} ../wrfinput_d${CR_DOMAIN}_${CMEM}
## APM: ---
##
      let MEM=${MEM}+1
   done
#
# APM: EMISSIONS
# APM: copy emission files for emission estimation
   let IMEM=1
   while [[ ${IMEM} -le ${NUM_MEMBERS} ]]; do
      export CMEM=e${IMEM}
      export KMEM=${IMEM}
      if [[ ${IMEM} -lt 1000 ]]; then export KMEM=0${IMEM}; fi
      if [[ ${IMEM} -lt 100 ]]; then export KMEM=00${IMEM}; export CMEM=e0${IMEM}; fi
      if [[ ${IMEM} -lt 10 ]]; then export KMEM=000${IMEM}; export CMEM=e00${IMEM}; fi
      cd ${RUN_DIR}/${DATE}/dart_filter/wrk_wrf_${CMEM}      
      export LL_DATE=${DATE}
      export LL_END_DATE=${DATE}
      export LL_YY=`echo ${LL_DATE} | cut -c1-4`
      export LL_MM=`echo ${LL_DATE} | cut -c5-6`
      export LL_DD=`echo ${LL_DATE} | cut -c7-8`
      export LL_HH=`echo ${LL_DATE} | cut -c9-10`
      export LL_FILE_DATE=${LL_YY}-${LL_MM}-${LL_DD}_${LL_HH}:00:00
      if [[ ${LL_DATE} -le ${FIRST_EMISS_INV_DATE} || ${ADD_EMISS} = ".false." ]]; then
         cp ${WRFCHEM_CHEM_EMISS_DIR}/wrfchemi_d${CR_DOMAIN}_${LL_FILE_DATE}.${CMEM} wrfchemi_d${CR_DOMAIN}
         cp ${WRFCHEM_CHEM_EMISS_DIR}/wrffirechemi_d${CR_DOMAIN}_${LL_FILE_DATE}.${CMEM} wrffirechemi_d${CR_DOMAIN}
         ncatted -O -a coordinates,E_CO,c,c,"XLONG, XLAT" wrfchemi_d${CR_DOMAIN}
         ncatted -O -a coordinates,E_NO,c,c,"XLONG, XLAT" wrfchemi_d${CR_DOMAIN}
         ncatted -O -a coordinates,ebu_in_co,c,c,"XLONG, XLAT" wrffirechemi_d${CR_DOMAIN}
         ncatted -O -a coordinates,ebu_in_no,c,c,"XLONG, XLAT" wrffirechemi_d${CR_DOMAIN}
         ncatted -O -a coordinates,ebu_in_oc,c,c,"XLONG, XLAT" wrffirechemi_d${CR_DOMAIN}
         ncatted -O -a coordinates,ebu_in_bc,c,c,"XLONG, XLAT" wrffirechemi_d${CR_DOMAIN}
         ncatted -O -a coordinates,ebu_in_c2h4,c,c,"XLONG, XLAT" wrffirechemi_d${CR_DOMAIN}
         ncatted -O -a coordinates,ebu_in_ch2o,c,c,"XLONG, XLAT" wrffirechemi_d${CR_DOMAIN}
         ncatted -O -a coordinates,ebu_in_ch3oh,c,c,"XLONG, XLAT" wrffirechemi_d${CR_DOMAIN}
      else
         cp ${BACKGND_FCST_DIR}/run_${CMEM}/wrfchemi_d${CR_DOMAIN}_${LL_FILE_DATE} wrfchemi_d${CR_DOMAIN}
         cp ${BACKGND_FCST_DIR}/run_${CMEM}/wrffirechemi_d${CR_DOMAIN}_${LL_FILE_DATE} wrffirechemi_d${CR_DOMAIN}
         ncatted -O -a coordinates,E_CO,c,c,"XLONG, XLAT" wrfchemi_d${CR_DOMAIN}
         ncatted -O -a coordinates,E_NO,c,c,"XLONG, XLAT" wrfchemi_d${CR_DOMAIN}
         ncatted -O -a coordinates,ebu_in_co,c,c,"XLONG, XLAT" wrffirechemi_d${CR_DOMAIN}
         ncatted -O -a coordinates,ebu_in_no,c,c,"XLONG, XLAT" wrffirechemi_d${CR_DOMAIN}
         ncatted -O -a coordinates,ebu_in_oc,c,c,"XLONG, XLAT" wrffirechemi_d${CR_DOMAIN}
         ncatted -O -a coordinates,ebu_in_bc,c,c,"XLONG, XLAT" wrffirechemi_d${CR_DOMAIN}
         ncatted -O -a coordinates,ebu_in_c2h4,c,c,"XLONG, XLAT" wrffirechemi_d${CR_DOMAIN}
         ncatted -O -a coordinates,ebu_in_ch2o,c,c,"XLONG, XLAT" wrffirechemi_d${CR_DOMAIN}
         ncatted -O -a coordinates,ebu_in_ch3oh,c,c,"XLONG, XLAT" wrffirechemi_d${CR_DOMAIN}
      fi
     let IMEM=${IMEM}+1
   done
#
# Create job script 
   TRANDOM=$$
   let MEM=1
   while [[ ${MEM} -le ${NUM_MEMBERS} ]]; do
      export CMEM=e${MEM}
      export KMEM=${MEM}
      if [[ ${MEM} -lt 1000 ]]; then export KMEM=0${MEM}; fi
      if [[ ${MEM} -lt 100 ]]; then export KMEM=00${MEM}; export CMEM=e0${MEM}; fi
      if [[ ${MEM} -lt 10 ]]; then export KMEM=000${MEM}; export CMEM=e00${MEM}; fi
      cd ${RUN_DIR}/${DATE}/dart_filter/wrk_wrf_${CMEM}
#
      export JOBRND=${TRANDOM}_wrf2drt
      ${HYBRID_SCRIPTS_DIR}/job_script_taki.ksh ${JOBRND} ${GENERAL_JOB_CLASS} ${GENERAL_TIME_LIMIT} ${GENERAL_NODES} ${GENERAL_TASKS} wrf_to_dart SERIAL
      sbatch job.ksh
      let MEM=${MEM}+1
   done
#
# Wait for wrf_to_dart to complete for each member
   cd ${RUN_DIR}/${DATE}/dart_filter
   ${HYBRID_SCRIPTS_DIR}/da_run_hold_taki.ksh ${TRANDOM}
   ${DART_DIR}/models/wrf_chem/namelist_scripts/DART/dart_create_input.nml.ksh
   cp ${EXPERIMENT_STATIC_FILES}/ubvals_b40.20th.track1_1996-2005.nc ./.
#
# APM: +++ another wrfapm / wrfout swap for emission inversion
   cp wrk_wrf_e001/wrfinput_d${CR_DOMAIN} ./
   cp wrk_wrf_e001/wrfchemi_d${CR_DOMAIN} ./
   cp wrk_wrf_e001/wrffirechemi_d${CR_DOMAIN} ./
   cp ${BACKGND_FCST_DIR}/run_e001/wrfout_d${CR_DOMAIN}_${FILE_DATE} wrfinput_d${CR_DOMAIN}
#   cp ${BACKGND_FCST_DIR}/run_e001/wrfapm_d${CR_DOMAIN}_${FILE_DATE} wrfinput_d${CR_DOMAIN}
# APM: ---
#
# Copy "out" inflation files from prior cycle to "in" inflation files for current cycle
   if ${USE_DART_INFL}; then
      if [[ ${DATE} -eq ${FIRST_DART_INFLATE_DATE} ]]; then
         export NL_INF_INITIAL_FROM_RESTART_PRIOR=.false.
         export NL_INF_SD_INITIAL_FROM_RESTART_PRIOR=.false.
         export NL_INF_INITIAL_FROM_RESTART_POST=.false.
         export NL_INF_SD_INITIAL_FROM_RESTART_POST=.false.
      else
         export NL_INF_INITIAL_FROM_RESTART_PRIOR=.true.
         export NL_INF_SD_INITIAL_FROM_RESTART_PRIOR=.true.
         export NL_INF_INITIAL_FROM_RESTART_POST=.true.
         export NL_INF_SD_INITIAL_FROM_RESTART_POST=.true.
      fi
      if [[ ${DATE} -ne ${FIRST_DART_INFLATE_DATE} ]]; then
         if [[ ${NL_INF_FLAVOR_PRIOR} != 0 ]]; then
            export INF_OUT_FILE_NAME_PRIOR=${RUN_DIR}/${PAST_DATE}/dart_filter/prior_inflate_ic_new
            cp ${INF_OUT_FILE_NAME_PRIOR} prior_inflate_ic_old
         fi
         if [[ ${NL_INF_FLAVOR_POST} != 0 ]]; then
            export INF_OUT_FILE_NAME_POST=${RUN_DIR}/${PAST_DATE}/dart_filter/post_inflate_ic_new
            cp ${NL_INF_OUT_FILE_NAME_POST} post_infalte_ic_old
         fi 
      fi
   fi
#
# Generate input.nml
   set -A temp `echo ${ASIM_MIN_DATE} 0 -g | ${DART_DIR}/models/wrf_chem/work/advance_time`
   (( temp[1]=${temp[1]}+1 ))
   export NL_FIRST_OBS_DAYS=${temp[0]}
   export NL_FIRST_OBS_SECONDS=${temp[1]}
   set -A temp `echo ${ASIM_MAX_DATE} 0 -g | ${DART_DIR}/models/wrf_chem/work/advance_time`
   export NL_LAST_OBS_DAYS=${temp[0]}
   export NL_LAST_OBS_SECONDS=${temp[1]}
#
   export NL_NUM_INPUT_FILES=1
   export NL_FILENAME_SEQ="'obs_seq.out'"
   export NL_FILENAME_OUT="'obs_seq.processed'"
   export NL_MOPITT_CO_RETRIEVAL_TYPE=\'${RETRIEVAL_TYPE_MOPITT}\'
   export NL_IASI_CO_RETRIEVAL_TYPE=\'${RETRIEVAL_TYPE_IASI}\'
   export NL_USE_LOG_CO=${USE_LOG_CO_LOGIC}
   export NL_USE_LOG_O3=${USE_LOG_O3_LOGIC}
#
   rm -rf input.nml
   ${DART_DIR}/models/wrf_chem/namelist_scripts/DART/dart_create_input.nml.ksh
#
# Make filter_apm_nml for special_outlier_threshold
   rm -rf filter_apm.nml
   cat << EOF > filter_apm.nml
&filter_apm_nml
special_outlier_threshold=${NL_SPECIAL_OUTLIER_THRESHOLD}
/
EOF
#
# Run DART_FILTER
# Create job script for this member and run it 
#
   RANDOM=$$
   export JOBRND=${RANDOM}_filter
   ${HYBRID_SCRIPTS_DIR}/job_script_taki.ksh ${JOBRND} ${FILTER_JOB_CLASS} ${FILTER_TIME_LIMIT} ${FILTER_NODES} ${FILTER_TASKS} filter PARALLEL
   sbatch -W job.ksh
#
# Check whether DART worked properly
  if [[ ! -f Prior_Diag.nc || ! -f Posterior_Diag.nc || ! -f obs_seq.final ]]; then
     echo APM: ERROR in DART FILTER EXIT
     exit
  fi
#
# Run DART_TO_WRF 
   TRANDOM=$$
   let MEM=1
   while [[ ${MEM} -le ${NUM_MEMBERS} ]]; do
      export CMEM=e${MEM}
      export KMEM=${MEM}
      if [[ ${MEM} -lt 1000 ]]; then export KMEM=0${MEM}; fi
      if [[ ${MEM} -lt 100 ]]; then export KMEM=00${MEM}; export CMEM=e0${MEM}; fi
      if [[ ${MEM} -lt 10 ]]; then export KMEM=000${MEM}; export CMEM=e00${MEM}; fi
#
      cd ${RUN_DIR}/${DATE}/dart_filter
      rm -rf wrk_dart_${CMEM}
      mkdir wrk_dart_${CMEM}
      cd ${RUN_DIR}/${DATE}/dart_filter/wrk_dart_${CMEM}
#
# &dart_to_wrf_nml
      export NL_MODEL_ADVANCE_FILE=.false.
      export NL_DART_RESTART_NAME=\'../filter_ic_new.${KMEM}\'
      export NL_USE_LOG_CO=${USE_LOG_CO_LOGIC}
      export NL_USE_LOG_O3=${USE_LOG_O3_LOGIC}
      rm -rf input.nml
      ${DART_DIR}/models/wrf_chem/namelist_scripts/DART/dart_create_input.nml.ksh
      cp ${DART_DIR}/models/wrf_chem/work/dart_to_wrf ./.
      cp ${BACKGND_FCST_DIR}/run_${CMEM}/wrfout_d${CR_DOMAIN}_${FILE_DATE} wrfinput_d${CR_DOMAIN}
#      cp ${BACKGND_FCST_DIR}/run_${CMEM}/wrfapm_d${CR_DOMAIN}_${FILE_DATE} wrfinput_d${CR_DOMAIN}
      export LL_DATE=${DATE}
      export LL_END_DATE=${DATE}
      export LL_YY=`echo ${LL_DATE} | cut -c1-4`
      export LL_MM=`echo ${LL_DATE} | cut -c5-6`
      export LL_DD=`echo ${LL_DATE} | cut -c7-8`
      export LL_HH=`echo ${LL_DATE} | cut -c9-10`
      export LL_FILE_DATE=${LL_YY}-${LL_MM}-${LL_DD}_${LL_HH}:00:00
      if [[ ${LL_DATE} -le ${FIRST_EMISS_INV_DATE} || ${ADD_EMISS} = ".false." ]]; then
         cp ${WRFCHEM_CHEM_EMISS_DIR}/wrfchemi_d${CR_DOMAIN}_${LL_FILE_DATE}.${CMEM} wrfchemi_d${CR_DOMAIN}
         cp ${WRFCHEM_CHEM_EMISS_DIR}/wrffirechemi_d${CR_DOMAIN}_${LL_FILE_DATE}.${CMEM} wrffirechemi_d${CR_DOMAIN}
         ncatted -O -a coordinates,E_CO,c,c,"XLONG, XLAT" wrfchemi_d${CR_DOMAIN}
         ncatted -O -a coordinates,E_NO,c,c,"XLONG, XLAT" wrfchemi_d${CR_DOMAIN}
         ncatted -O -a coordinates,ebu_in_co,c,c,"XLONG, XLAT" wrffirechemi_d${CR_DOMAIN}
         ncatted -O -a coordinates,ebu_in_no,c,c,"XLONG, XLAT" wrffirechemi_d${CR_DOMAIN}
         ncatted -O -a coordinates,ebu_in_oc,c,c,"XLONG, XLAT" wrffirechemi_d${CR_DOMAIN}
         ncatted -O -a coordinates,ebu_in_bc,c,c,"XLONG, XLAT" wrffirechemi_d${CR_DOMAIN}
         ncatted -O -a coordinates,ebu_in_c2h4,c,c,"XLONG, XLAT" wrffirechemi_d${CR_DOMAIN}
         ncatted -O -a coordinates,ebu_in_ch2o,c,c,"XLONG, XLAT" wrffirechemi_d${CR_DOMAIN}
         ncatted -O -a coordinates,ebu_in_ch3oh,c,c,"XLONG, XLAT" wrffirechemi_d${CR_DOMAIN}
      else
         cp ${BACKGND_FCST_DIR}/run_${CMEM}/wrfchemi_d${CR_DOMAIN}_${LL_FILE_DATE} wrfchemi_d${CR_DOMAIN}
         cp ${BACKGND_FCST_DIR}/run_${CMEM}/wrffirechemi_d${CR_DOMAIN}_${LL_FILE_DATE} wrffirechemi_d${CR_DOMAIN}
         ncatted -O -a coordinates,E_CO,c,c,"XLONG, XLAT" wrfchemi_d${CR_DOMAIN}
         ncatted -O -a coordinates,E_NO,c,c,"XLONG, XLAT" wrfchemi_d${CR_DOMAIN}
         ncatted -O -a coordinates,ebu_in_co,c,c,"XLONG, XLAT" wrffirechemi_d${CR_DOMAIN}
         ncatted -O -a coordinates,ebu_in_no,c,c,"XLONG, XLAT" wrffirechemi_d${CR_DOMAIN}
         ncatted -O -a coordinates,ebu_in_oc,c,c,"XLONG, XLAT" wrffirechemi_d${CR_DOMAIN}
         ncatted -O -a coordinates,ebu_in_bc,c,c,"XLONG, XLAT" wrffirechemi_d${CR_DOMAIN}
         ncatted -O -a coordinates,ebu_in_c2h4,c,c,"XLONG, XLAT" wrffirechemi_d${CR_DOMAIN}
         ncatted -O -a coordinates,ebu_in_ch2o,c,c,"XLONG, XLAT" wrffirechemi_d${CR_DOMAIN}
         ncatted -O -a coordinates,ebu_in_ch3oh,c,c,"XLONG, XLAT" wrffirechemi_d${CR_DOMAIN}
      fi
#
      export JOBRND=${TRANDOM}_drt2wrf
      ${HYBRID_SCRIPTS_DIR}/job_script_taki.ksh ${JOBRND} ${GENERAL_JOB_CLASS} ${GENERAL_TIME_LIMIT} ${GENERAL_NODES} ${GENERAL_TASKS} dart_to_wrf SERIAL
      sbatch job.ksh
#
      let MEM=${MEM}+1
   done
#
# Wait for dart_to_wrf to complete for each member
   cd ${RUN_DIR}/${DATE}/dart_filter
   ${HYBRID_SCRIPTS_DIR}/da_run_hold_taki.ksh ${TRANDOM}
#
# Copy converted output files
   let MEM=1
   while [[ ${MEM} -le ${NUM_MEMBERS} ]]; do
      export CMEM=e${MEM}
      export KMEM=${MEM}
      if [[ ${MEM} -lt 1000 ]]; then export KMEM=0${MEM}; fi
      if [[ ${MEM} -lt 100 ]]; then export KMEM=00${MEM}; export CMEM=e0${MEM}; fi
      if [[ ${MEM} -lt 10 ]]; then export KMEM=000${MEM}; export CMEM=e00${MEM}; fi
      cp wrk_dart_${CMEM}/wrfinput_d${CR_DOMAIN} wrfout_d${CR_DOMAIN}_${FILE_DATE}_filt.${CMEM} 
      let MEM=${MEM}+1
   done
fi


#
#########################################################################
#
# UPDATE COARSE RESOLUTION BOUNDARY CONDIIONS
#
#########################################################################
#
if ${RUN_UPDATE_BC}; then
   if [[ ! -d ${RUN_DIR}/${DATE}/update_bc ]]; then
      mkdir -p ${RUN_DIR}/${DATE}/update_bc
      cd ${RUN_DIR}/${DATE}/update_bc
   else
      cd ${RUN_DIR}/${DATE}/update_bc
   fi
#
   let MEM=1
   while [[ ${MEM} -le ${NUM_MEMBERS} ]]; do
      export CMEM=e${MEM}
      export KMEM=${MEM}
      if [[ ${MEM} -lt 1000 ]]; then export KMEM=0${MEM}; fi
      if [[ ${MEM} -lt 100 ]]; then export KMEM=00${MEM}; export CMEM=e0${MEM}; fi
      if [[ ${MEM} -lt 10 ]]; then export KMEM=000${MEM}; export CMEM=e00${MEM}; fi
#
      export CYCLING=true
      export OPS_FORC_FILE=${WRFCHEM_CHEM_ICBC_DIR}/wrfinput_d${CR_DOMAIN}_${FILE_DATE}.${CMEM}
      export BDYCDN_IN=${WRFCHEM_CHEM_ICBC_DIR}/wrfbdy_d${CR_DOMAIN}_${FILE_DATE}.${CMEM}
      cp ${BDYCDN_IN} wrfbdy_d${CR_DOMAIN}_${FILE_DATE}_prior.${CMEM}
      export DA_OUTPUT_FILE=${DART_FILTER_DIR}/wrfout_d${CR_DOMAIN}_${FILE_DATE}_filt.${CMEM} 
      export BDYCDN_OUT=wrfbdy_d${CR_DOMAIN}_${FILE_DATE}_filt.${CMEM}    
      ${HYBRID_SCRIPTS_DIR}/da_run_update_bc.ksh > index_update_bc 2>&1
#
      let MEM=$MEM+1
   done
fi
#
#########################################################################
#
# CALCULATE ENSEMBLE MEAN_INPUT
#
#########################################################################
#
if ${RUN_ENSEMBLE_MEAN_INPUT}; then
   if [[ ! -d ${RUN_DIR}/${DATE}/ensemble_mean_input ]]; then
      mkdir -p ${RUN_DIR}/${DATE}/ensemble_mean_input
      cd ${RUN_DIR}/${DATE}/ensemble_mean_input
   else
      cd ${RUN_DIR}/${DATE}/ensemble_mean_input
   fi
   rm -rf wrfinput_d${CR_DOMAIN}_mean
   rm -rf wrfbdy_d${CR_DOMAIN}_mean
   rm -rf wrfinput_d${FR_DOMAIN}_mean
   let MEM=1
   while [[ ${MEM} -le ${NUM_MEMBERS} ]]; do
      export CMEM=e${MEM}
      export KMEM=${MEM}
      if [[ ${MEM} -lt 1000 ]]; then export KMEM=0${MEM}; fi
      if [[ ${MEM} -lt 100 ]]; then export KMEM=00${MEM}; export CMEM=e0${MEM}; fi
      if [[ ${MEM} -lt 10 ]]; then export KMEM=000${MEM}; export CMEM=e00${MEM}; fi
      if [[ ${DATE} -eq ${INITIAL_DATE}  ]]; then
         cp ${WRFCHEM_MET_IC_DIR}/wrfinput_d${CR_DOMAIN}_${START_FILE_DATE}.${CMEM} wrfinput_d${CR_DOMAIN}_${KMEM}
         cp ${WRFCHEM_MET_BC_DIR}/wrfbdy_d${CR_DOMAIN}_${START_FILE_DATE}.${CMEM} wrfbdy_d${CR_DOMAIN}_${KMEM}
      else
         cp ${DART_FILTER_DIR}/wrfout_d${CR_DOMAIN}_${START_FILE_DATE}_filt.${CMEM} wrfinput_d${CR_DOMAIN}_${KMEM}
         cp ${UPDATE_BC_DIR}/wrfbdy_d${CR_DOMAIN}_${START_FILE_DATE}_filt.${CMEM} wrfbdy_d${CR_DOMAIN}_${KMEM}
      fi
      let MEM=${MEM}+1
   done
   cp ${REAL_DIR}/wrfinput_d${FR_DOMAIN}_${START_FILE_DATE} wrfinput_d${FR_DOMAIN}_mean
#
# Calculate ensemble mean
   ncea -n ${NUM_MEMBERS},4,1 wrfinput_d${CR_DOMAIN}_0001 wrfinput_d${CR_DOMAIN}_mean
   ncea -n ${NUM_MEMBERS},4,1 wrfbdy_d${CR_DOMAIN}_0001 wrfbdy_d${CR_DOMAIN}_mean
#
# Calculate ensemble spread
   rm -rf wrfinput_d${CR_DOMAIN}_tmp*
   rm -rf wrfinput_d${CR_DOMAIN}_sprd 
   ncecat -n ${NUM_MEMBERS},4,1 wrfinput_d${CR_DOMAIN}_0001 wrfinput_d${CR_DOMAIN}_tmp1
   ncwa -O -a record wrfinput_d${CR_DOMAIN}_tmp1 wrfinput_d${CR_DOMAIN}_tmp2
   ncbo --op_typ='-' wrfinput_d${CR_DOMAIN}_tmp1 wrfinput_d${CR_DOMAIN}_tmp2 wrfinput_d${CR_DOMAIN}_tmp3
   ncra -y rmssdn wrfinput_d${CR_DOMAIN}_tmp3 wrfinput_d${CR_DOMAIN}_sprd
   rm -rf wrfinput_d${CR_DOMAIN}_tmp*
   rm -rf wrfinput_d${CR_DOMAIN}_*0*
   rm -rf wrfbdy_d${CR_DOMAIN}_*0*
fi
#
#########################################################################
#
# RUN WRFCHEM_CYCLE_CR
#
#########################################################################
#
if ${RUN_WRFCHEM_CYCLE_CR}; then
   if [[ ! -d ${RUN_DIR}/${DATE}/wrfchem_cycle_cr ]]; then
      mkdir -p ${RUN_DIR}/${DATE}/wrfchem_cycle_cr
      cd ${RUN_DIR}/${DATE}/wrfchem_cycle_cr
   else
      cd ${RUN_DIR}/${DATE}/wrfchem_cycle_cr
   fi
#
# Run WRF-Chem for all ensemble members
   TRANDOM=$$
   let IMEM=1
   export L_NUM_MEMBERS=${NUM_MEMBERS}
   if ${RUN_SPECIAL_FORECAST}; then
      export L_NUM_MEMBERS=${NUM_SPECIAL_FORECAST}
   fi
   while [[ ${IMEM} -le ${L_NUM_MEMBERS} ]]; do
      export MEM=${IMEM}
      export NL_TIME_STEP=${NNL_TIME_STEP}
      if ${RUN_SPECIAL_FORECAST}; then
         export MEM=${SPECIAL_FORECAST_MEM[${IMEM}]}
         let NL_TIME_STEP=${NNL_TIME_STEP}*${SPECIAL_FORECAST_FAC}
      fi
      export CMEM=e${MEM}
      export KMEM=${MEM}
      if [[ ${MEM} -lt 1000 ]]; then export KMEM=0${MEM}; fi
      if [[ ${MEM} -lt 100 ]]; then export KMEM=00${MEM}; export CMEM=e0${MEM}; fi
      if [[ ${MEM} -lt 10 ]]; then export KMEM=000${MEM}; export CMEM=e00${MEM}; fi
      export L_RUN_DIR=run_${CMEM}
      cd ${RUN_DIR}/${DATE}/wrfchem_cycle_cr
      if ${RUN_SPECIAL_FORECAST}; then
         rm -rf ${L_RUN_DIR}
      fi
      if [[ ! -e ${L_RUN_DIR} ]]; then
         mkdir ${L_RUN_DIR}
         cd ${L_RUN_DIR}
      else
         cd ${L_RUN_DIR}
      fi
#
# Get WRF-Chem parameter files
      cp ${DART_DIR}/models/wrf_chem/work/advance_time ./.
      cp ${DART_DIR}/models/wrf_chem/work/input.nml ./.
      cp ${WRFCHEM_DIR}/test/em_real/wrf.exe ./.
      cp ${WRFCHEM_DIR}/test/em_real/aerosol.formatted ./.
      cp ${WRFCHEM_DIR}/test/em_real/aerosol_lat.formatted ./.
      cp ${WRFCHEM_DIR}/test/em_real/aerosol_lon.formatted ./.
      cp ${WRFCHEM_DIR}/test/em_real/aerosol_plev.formatted ./.
      cp ${WRFCHEM_DIR}/test/em_real/bulkdens.asc_s_0_03_0_9 ./.
      cp ${WRFCHEM_DIR}/test/em_real/bulkradii.asc_s_0_03_0_9 ./.
      cp ${WRFCHEM_DIR}/test/em_real/CAM_ABS_DATA ./.
      cp ${WRFCHEM_DIR}/test/em_real/CAM_AEROPT_DATA ./.
      cp ${WRFCHEM_DIR}/test/em_real/CAMtr_volume_mixing_ratio ./.
      cp ${WRFCHEM_DIR}/test/em_real/CAMtr_volume_mixing_ratio.A1B ./.
      cp ${WRFCHEM_DIR}/test/em_real/CAMtr_volume_mixing_ratio.A2 ./.
      cp ${WRFCHEM_DIR}/test/em_real/CAMtr_volume_mixing_ratio.RCP4.5 ./.
      cp ${WRFCHEM_DIR}/test/em_real/CAMtr_volume_mixing_ratio.RCP6 ./.
      cp ${WRFCHEM_DIR}/test/em_real/capacity.asc ./.
      cp ${WRFCHEM_DIR}/test/em_real/CCN_ACTIVATE.BIN ./.
      cp ${WRFCHEM_DIR}/test/em_real/CLM_ALB_ICE_DFS_DATA ./.
      cp ${WRFCHEM_DIR}/test/em_real/CLM_ALB_ICE_DRC_DATA ./.
      cp ${WRFCHEM_DIR}/test/em_real/CLM_ASM_ICE_DFS_DATA ./.
      cp ${WRFCHEM_DIR}/test/em_real/CLM_ASM_ICE_DRC_DATA ./.
      cp ${WRFCHEM_DIR}/test/em_real/CLM_DRDSDT0_DATA ./.
      cp ${WRFCHEM_DIR}/test/em_real/CLM_EXT_ICE_DFS_DATA ./.
      cp ${WRFCHEM_DIR}/test/em_real/CLM_EXT_ICE_DRC_DATA ./.
      cp ${WRFCHEM_DIR}/test/em_real/CLM_KAPPA_DATA ./.
      cp ${WRFCHEM_DIR}/test/em_real/CLM_TAU_DATA ./.
      cp ${WRFCHEM_DIR}/test/em_real/coeff_p.asc ./.
      cp ${WRFCHEM_DIR}/test/em_real/coeff_q.asc ./.
      cp ${WRFCHEM_DIR}/test/em_real/constants.asc ./.
      cp ${WRFCHEM_DIR}/test/em_real/ETAMPNEW_DATA ./.
      cp ${WRFCHEM_DIR}/test/em_real/ETAMPNEW_DATA.expanded_rain ./.
      cp ${WRFCHEM_DIR}/test/em_real/GENPARM.TBL ./.
      cp ${WRFCHEM_DIR}/test/em_real/grib2map.tbl ./.
      cp ${WRFCHEM_DIR}/test/em_real/gribmap.txt ./.
      cp ${WRFCHEM_DIR}/test/em_real/kernels.asc_s_0_03_0_9 ./.
      cp ${WRFCHEM_DIR}/test/em_real/kernels_z.asc ./.
      cp ${WRFCHEM_DIR}/test/em_real/LANDUSE.TBL ./.
      cp ${WRFCHEM_DIR}/test/em_real/masses.asc ./.
      cp ${WRFCHEM_DIR}/test/em_real/MPTABLE.TBL ./.
      cp ${WRFCHEM_DIR}/test/em_real/ozone.formatted ./.
      cp ${WRFCHEM_DIR}/test/em_real/ozone_lat.formatted ./.
      cp ${WRFCHEM_DIR}/test/em_real/ozone_plev.formatted ./.
      cp ${WRFCHEM_DIR}/test/em_real/RRTM_DATA ./.
      cp ${WRFCHEM_DIR}/test/em_real/RRTMG_LW_DATA ./.
      cp ${WRFCHEM_DIR}/test/em_real/RRTMG_SW_DATA ./.
      cp ${WRFCHEM_DIR}/test/em_real/SOILPARM.TBL ./.
      cp ${WRFCHEM_DIR}/test/em_real/termvels.asc ./.
      cp ${WRFCHEM_DIR}/test/em_real/tr49t67 ./.
      cp ${WRFCHEM_DIR}/test/em_real/tr49t85 ./.
      cp ${WRFCHEM_DIR}/test/em_real/tr67t85 ./.
      cp ${WRFCHEM_DIR}/test/em_real/URBPARM.TBL ./.
      cp ${WRFCHEM_DIR}/test/em_real/VEGPARM.TBL ./.
      cp ${EXPERIMENT_HIST_IO_DIR}/hist_io_flds_v1 ./.
      cp ${EXPERIMENT_HIST_IO_DIR}/hist_io_flds_v2 ./.
      cp ${EXPERIMENT_HIST_IO_DIR}/hist_io_flds_v3 ./.
#
      cp ${EXPERIMENT_STATIC_FILES}/clim_p_trop.nc ./.
      cp ${EXO_COLDENS_DIR}/exo_coldens_d${CR_DOMAIN} ./.
      cp ${EXO_COLDENS_DIR}/exo_coldens_d${MR_DOMAIN} ./.
      cp ${EXO_COLDENS_DIR}/exo_coldens_d${FR_DOMAIN} ./.
      cp ${SEASONS_WES_DIR}/wrf_season_wes_usgs_d${CR_DOMAIN}.nc ./.
      cp ${SEASONS_WES_DIR}/wrf_season_wes_usgs_d${MR_DOMAIN}.nc ./.
      cp ${SEASONS_WES_DIR}/wrf_season_wes_usgs_d${FR_DOMAIN}.nc ./.
#
# Get WRF-Chem emissions files
      export L_DATE=${START_DATE}
      while [[ ${L_DATE} -le ${END_DATE} ]]; do
         export L_YY=`echo ${L_DATE} | cut -c1-4`
         export L_MM=`echo ${L_DATE} | cut -c5-6`
         export L_DD=`echo ${L_DATE} | cut -c7-8`
         export L_HH=`echo ${L_DATE} | cut -c9-10`
         export L_FILE_DATE=${L_YY}-${L_MM}-${L_DD}_${L_HH}:00:00
         cp ${WRFCHEM_CHEM_EMISS_DIR}/wrfbiochemi_d${CR_DOMAIN}_${L_FILE_DATE}.${CMEM} wrfbiochemi_d${CR_DOMAIN}_${L_FILE_DATE}
         cp ${WRFCHEM_CHEM_EMISS_DIR}/wrfbiochemi_d${MR_DOMAIN}_${L_FILE_DATE}.${CMEM} wrfbiochemi_d${MR_DOMAIN}_${L_FILE_DATE}
         cp ${WRFCHEM_CHEM_EMISS_DIR}/wrffirechemi_d${CR_DOMAIN}_${L_FILE_DATE}.${CMEM} wrffirechemi_d${CR_DOMAIN}_${L_FILE_DATE}
         cp ${WRFCHEM_CHEM_EMISS_DIR}/wrffirechemi_d${MR_DOMAIN}_${L_FILE_DATE}.${CMEM} wrffirechemi_d${MR_DOMAIN}_${L_FILE_DATE}
         cp ${WRFCHEM_CHEM_EMISS_DIR}/wrfchemi_d${CR_DOMAIN}_${L_FILE_DATE}.${CMEM} wrfchemi_d${CR_DOMAIN}_${L_FILE_DATE}
         cp ${WRFCHEM_CHEM_EMISS_DIR}/wrfchemi_d${MR_DOMAIN}_${L_FILE_DATE}.${CMEM} wrfchemi_d${MR_DOMAIN}_${L_FILE_DATE}
         if [[ ${L_DATE} -eq ${START_DATE} ]]; then
            cp ${DART_FILTER_DIR}/wrk_dart_${CMEM}/wrfchemi_d${CR_DOMAIN} wrfchemi_d${CR_DOMAIN}_${L_FILE_DATE}
            cp ${DART_FILTER_DIR}/wrk_dart_${CMEM}/wrfchemi_d${MR_DOMAIN} wrfchemi_d${MR_DOMAIN}_${L_FILE_DATE}
            cp ${DART_FILTER_DIR}/wrk_dart_${CMEM}/wrffirechemi_d${CR_DOMAIN} wrffirechemi_d${CR_DOMAIN}_${L_FILE_DATE}
            cp ${DART_FILTER_DIR}/wrk_dart_${CMEM}/wrffirechemi_d${MR_DOMAIN} wrffirechemi_d${MR_DOMAIN}_${L_FILE_DATE}
         else
            cp ${WRFCHEM_CHEM_EMISS_DIR}/wrfchemi_d${CR_DOMAIN}_${L_FILE_DATE}.${CMEM} wrfchemi_d${CR_DOMAIN}_${L_FILE_DATE}
            cp ${WRFCHEM_CHEM_EMISS_DIR}/wrfchemi_d${MR_DOMAIN}_${L_FILE_DATE}.${CMEM} wrfchemi_d${MR_DOMAIN}_${L_FILE_DATE}
            cp ${WRFCHEM_CHEM_EMISS_DIR}/wrffirechemi_d${CR_DOMAIN}_${L_FILE_DATE}.${CMEM} wrffirechemi_d${CR_DOMAIN}_${L_FILE_DATE}
            cp ${WRFCHEM_CHEM_EMISS_DIR}/wrffirechemi_d${MR_DOMAIN}_${L_FILE_DATE}.${CMEM} wrffirechemi_d${MR_DOMAIN}_${L_FILE_DATE}
         fi
         export L_DATE=$(${BUILD_DIR}/da_advance_time.exe ${L_DATE} +1 2>/dev/null)
      done
#
# Get WR-Chem input and bdy files
      cp ${DART_FILTER_DIR}/wrfout_d${CR_DOMAIN}_${START_FILE_DATE}_filt.${CMEM} wrfinput_d${CR_DOMAIN}
      cp ${DART_FILTER_DIR}/wrfout_d${MR_DOMAIN}_${START_FILE_DATE}_filt.${CMEM} wrfinput_d${MR_DOMAIN}
      cp ${UPDATE_BC_DIR}/wrfbdy_d${CR_DOMAIN}_${START_FILE_DATE}_filt.${CMEM} wrfbdy_d${CR_DOMAIN}
#
# APM SKIP_DART_TEST
#      cp ${WRFCHEM_CHEM_ICBC_DIR}/wrfinput_d${CR_DOMAIN}_${START_FILE_DATE}.${CMEM} wrfinput_d${CR_DOMAIN}
#      cp ${WRFCHEM_CHEM_ICBC_DIR}/wrfbdy_d${CR_DOMAIN}_${START_FILE_DATE}.${CMEM} wrfbdy_d${CR_DOMAIN}
#
# Update the other emission files
      if [[ ${ADD_EMISS} = ".true." ]]; then
         cp wrfchemi_d${CR_DOMAIN}_${L_FILE_DATE} wrfchemi_d${CR_DOMAIN}_prior
         cp wrfchemi_d${CR_DOMAIN}_${L_FILE_DATE} wrfchemi_d${CR_DOMAIN}
         cp wrffirechemi_d${CR_DOMAIN}_${L_FILE_DATE} wrffirechemi_d${CR_DOMAIN}_prior
         cp wrffirechemi_d${CR_DOMAIN}_${L_FILE_DATE} wrffirechemi_d${CR_DOMAIN}
         cp wrfchemi_d${MR_DOMAIN}_${L_FILE_DATE} wrfchemi_d${MR_DOMAIN}_prior
         cp wrfchemi_d${MR_DOMAIN}_${L_FILE_DATE} wrfchemi_d${MR_DOMAIN}
         cp wrffirechemi_d${MR_DOMAIN}_${L_FILE_DATE} wrffirechemi_d${MR_DOMAIN}_prior
         cp wrffirechemi_d${MR_DOMAIN}_${L_FILE_DATE} wrffirechemi_d${MR_DOMAIN}
         cp ${ADJUST_EMISS_DIR}/work/adjust_chem_emiss.exe ./.
         export L_DATE=$(${BUILD_DIR}/da_advance_time.exe ${START_DATE} +1 2>/dev/null)
         while [[ ${L_DATE} -le ${END_DATE} ]]; do 
            export L_YY=$(echo $L_DATE | cut -c1-4)
            export L_MM=$(echo $L_DATE | cut -c5-6)
            export L_DD=$(echo $L_DATE | cut -c7-8)
            export L_HH=$(echo $L_DATE | cut -c9-10)
            export L_FILE_DATE=${L_YY}-${L_MM}-${L_DD}_${L_HH}:00:00
#
# Coarse domain
#----------------------------------------------------------------------
            export NL_WRFCHEMI_PRIOR=wrfchemi_d${CR_DOMAIN}_prior
            export NL_WRFCHEMI_POST=wrfchemi_d${CR_DOMAIN}
            export NL_WRFCHEMI_OLD=wrfchemi_d${CR_DOMAIN}_${L_FILE_DATE}
            export NL_WRFCHEMI_NEW=wrfchemi_d${CR_DOMAIN}_new
            cp ${NL_WRFCHEMI_OLD} ${NL_WRFCHEMI_NEW}
#           
            export NL_WRFFIRECHEMI_PRIOR=wrffirechemi_d${CR_DOMAIN}_prior
            export NL_WRFFIRECHEMI_POST=wrffirechemi_d${CR_DOMAIN}
            export NL_WRFFIRECHEMI_OLD=wrffirechemi_d${CR_DOMAIN}_${L_FILE_DATE}
            export NL_WRFFIRECHEMI_NEW=wrffirechemi_d${CR_DOMAIN}_new
            cp ${NL_WRFFIRECHEMI_OLD} ${NL_WRFFIRECHEMI_NEW}
#
# Make adjust_chem_nml for special_outlier_threshold
            rm -rf adjust_chem_emiss.nml
            cat <<  EOF > adjust_chem_emiss.nml
&adjust_chem_emiss
fac=${EMISS_DAMP_CYCLE},
facc=${EMISS_DAMP_INTRA_CYCLE},
nx=${NNXP_CR},
ny=${NNYP_CR},
nz=${NNZP_CR},
nz_chemi=${NZ_CHEMI},
nz_firechemi=${NZ_FIRECHEMI},
nchemi_emiss=${NCHEMI_EMISS},
nfirechemi_emiss=${NFIRECHEMI_EMISS},
wrfchemi_prior='${NL_WRFCHEMI_PRIOR}',
wrfchemi_post='${NL_WRFCHEMI_POST}',
wrfchemi_old='${NL_WRFCHEMI_OLD}',
wrfchemi_new='${NL_WRFCHEMI_NEW}',
wrffirechemi_prior='${NL_WRFFIRECHEMI_PRIOR}',
wrffirechemi_post='${NL_WRFFIRECHEMI_POST}',
wrffirechemi_old='${NL_WRFFIRECHEMI_OLD}',
wrffirechemi_new='${NL_WRFFIRECHEMI_NEW}'
/
EOF
            ./adjust_chem_emiss.exe > index_adjust_chem_emiss
#
            cp ${NL_WRFCHEMI_NEW} ${NL_WRFCHEMI_OLD}
            cp ${NL_WRFFIRECHEMI_NEW} ${NL_WRFFIRECHEMI_OLD}

#
# Medium domain
#----------------------------------------------------------------------
            export NL_WRFCHEMI_PRIOR=wrfchemi_d${MR_DOMAIN}_prior
            export NL_WRFCHEMI_POST=wrfchemi_d${MR_DOMAIN}
            export NL_WRFCHEMI_OLD=wrfchemi_d${MR_DOMAIN}_${L_FILE_DATE}
            export NL_WRFCHEMI_NEW=wrfchemi_d${MR_DOMAIN}_new
            cp ${NL_WRFCHEMI_OLD} ${NL_WRFCHEMI_NEW}
#           
            export NL_WRFFIRECHEMI_PRIOR=wrffirechemi_d${MR_DOMAIN}_prior
            export NL_WRFFIRECHEMI_POST=wrffirechemi_d${MR_DOMAIN}
            export NL_WRFFIRECHEMI_OLD=wrffirechemi_d${MR_DOMAIN}_${L_FILE_DATE}
            export NL_WRFFIRECHEMI_NEW=wrffirechemi_d${MR_DOMAIN}_new
            cp ${NL_WRFFIRECHEMI_OLD} ${NL_WRFFIRECHEMI_NEW}
#
# Make adjust_chem_nml for special_outlier_threshold
            rm -rf adjust_chem_emiss.nml
            cat <<  EOF > adjust_chem_emiss.nml
&adjust_chem_emiss
fac=${EMISS_DAMP_CYCLE},
facc=${EMISS_DAMP_INTRA_CYCLE},
nx=${NNXP_MR},
ny=${NNYP_MR},
nz=${NNZP_MR},
nz_chemi=${NZ_CHEMI},
nz_firechemi=${NZ_FIRECHEMI},
nchemi_emiss=${NCHEMI_EMISS},
nfirechemi_emiss=${NFIRECHEMI_EMISS},
wrfchemi_prior='${NL_WRFCHEMI_PRIOR}',
wrfchemi_post='${NL_WRFCHEMI_POST}',
wrfchemi_old='${NL_WRFCHEMI_OLD}',
wrfchemi_new='${NL_WRFCHEMI_NEW}',
wrffirechemi_prior='${NL_WRFFIRECHEMI_PRIOR}',
wrffirechemi_post='${NL_WRFFIRECHEMI_POST}',
wrffirechemi_old='${NL_WRFFIRECHEMI_OLD}',
wrffirechemi_new='${NL_WRFFIRECHEMI_NEW}'
/
EOF
            ./adjust_chem_emiss.exe > index_adjust_chem_emiss
#
            cp ${NL_WRFCHEMI_NEW} ${NL_WRFCHEMI_OLD}
            cp ${NL_WRFFIRECHEMI_NEW} ${NL_WRFFIRECHEMI_OLD}

            export L_DATE=`echo ${L_DATE} +1h | ./advance_time`
         done
      fi
#
# Create WRF-Chem namelist.input 
      export NL_MAX_DOM=2
      export NL_IOFIELDS_FILENAME=\'hist_io_flds_v1\',\'hist_io_flds_v2\',\'hist_io_flds_v3\'
      rm -rf namelist.input
      ${HYBRID_SCRIPTS_DIR}/da_create_wrfchem_namelist_RT.ksh
#
      export JOBRND=${TRANDOM}_wrf_cycle_cr
      ${HYBRID_SCRIPTS_DIR}/job_script_taki.ksh ${JOBRND} ${WRFCHEM_JOB_CLASS} ${WRFCHEM_TIME_LIMIT} ${WRFCHEM_NODES} ${WRFCHEM_TASKS} wrf.exe PARALLEL
      sbatch job.ksh
#
      let IMEM=${IMEM}+1
   done
#
# Wait for WRFCHEM to complete for each member
   ${HYBRID_SCRIPTS_DIR}/da_run_hold_taki.ksh ${TRANDOM}
fi
#
#########################################################################
#
# FIND DEEPEST MEMBER
#
#########################################################################
#
if ${RUN_BAND_DEPTH}; then
   if [[ ! -d ${RUN_DIR}/${DATE}/band_depth ]]; then
      mkdir -p ${RUN_DIR}/${DATE}/band_depth
      cd ${RUN_DIR}/${DATE}/band_depth
   else
      cd ${RUN_DIR}/${DATE}/band_depth
   fi
#
# set the forecast directory
   if [[ ${DATE} -eq ${INITIAL_DATE} ]]; then
      export OUTPUT_DIR=${WRFCHEM_INITIAL_DIR}
   else
      export OUTPUT_DIR=${WRFCHEM_CYCLE_CR_DIR}
   fi
   cp ${DART_DIR}/models/wrf_chem/work/advance_time ./.
   export END_CYCLE_DATE=$($BUILD_DIR/da_advance_time.exe ${START_DATE} ${CYCLE_PERIOD} 2>/dev/null)
   export B_YYYY=$(echo $END_CYCLE_DATE | cut -c1-4)
   export B_MM=$(echo $END_CYCLE_DATE | cut -c5-6) 
   export B_DD=$(echo $END_CYCLE_DATE | cut -c7-8)
   export B_HH=$(echo $END_CYCLE_DATE | cut -c9-10)
   export B_FILE_DATE=${B_YYYY}-${B_MM}-${B_DD}_${B_HH}:00:00
#
# link in forecasts for deepest member determination
   let MEM=1
   while [[ ${MEM} -le ${NUM_MEMBERS} ]]; do
      export CMEM=e${MEM}
      export KMEM=${MEM}
      if [[ ${MEM} -lt 1000 ]]; then export KMEM=0${MEM}; fi
      if [[ ${MEM} -lt 100 ]]; then export KMEM=00${MEM}; export CMEM=e0${MEM}; fi
      if [[ ${MEM} -lt 10 ]]; then export KMEM=000${MEM}; export CMEM=e00${MEM}; fi
      rm -rf wrfout_d${CR_DOMAIN}.${CMEM}
      ln -sf ${OUTPUT_DIR}/run_${CMEM}/wrfout_d${CR_DOMAIN}_${B_FILE_DATE}.${CMEM} wrfout_d${CR_DOMAIN}.${CMEM}
      let MEM=${MEM}+1
   done
#
# copy band depth code
   cp ${RUN_BAND_DEPTH_DIR}/ComputeBandDepth.m ./.
   rm -rf job.ksh
   rm -rf mat_*.err
   rm -rf mat_*.out
   touch job.ksh
#
   RANDOM=$$
   export JOBRND=${RANDOM}_deepmem
   cat << EOFF > job.ksh
#!/bin/ksh -aeux
#SBATCH --job-name ${JOBRND}
#SBATCH --qos ${GENERAL_JOB_CLASS}
#SBATCH --time ${GENERAL_TIME_LIMIT}
#SBATCH --output ${JOBRND}.log-%j.out
#SBATCH --nodes ${GENERAL_NODES}
#SBATCH --ntasks ${GENERAL_TASKS}
#SBATCH --partition batch
module load matlab
#
matlab -nosplash -nodesktop -r 'ComputeBandDepth(.09)'
export RC=\$?     
if [[ -f SUCCESS ]]; then rm -rf SUCCESS; fi     
if [[ -f FAILED ]]; then rm -rf FAILED; fi          
if [[ \$RC = 0 ]]; then
   touch SUCCESS
else
   touch FAILED 
   exit
fi
EOFF
   sbatch -W job.ksh 
#
# run band depth script
   source shell_file.ksh
   export CMEM=e${DEEP_MEMBER}
   if [[ ${DEEP_MEMBER} -lt 100 ]]; then export CMEM=e0${DEEP_MEMBER}; fi
   if [[ ${DEEP_MEMBER} -lt 10 ]]; then export CMEM=e00${DEEP_MEMBER}; fi
   export CLOSE_MEM_ID=${CMEM}
fi
#
#########################################################################
#
# RUN WRFCHEM_CYCLE_MR
#
#########################################################################
#
if ${RUN_WRFCHEM_CYCLE_MR}; then
   if [[ ! -d ${RUN_DIR}/${DATE}/wrfchem_cycle_mr ]]; then
      mkdir -p ${RUN_DIR}/${DATE}/wrfchem_cycle_mr
      cd ${RUN_DIR}/${DATE}/wrfchem_cycle_mr
   else
      cd ${RUN_DIR}/${DATE}/wrfchem_cycle_mr
   fi
#
# Get WRF-Chem parameter files
   cp ${WRFCHEM_DIR}/test/em_real/wrf.exe ./.
   cp ${WRFCHEM_DIR}/test/em_real/CAM_ABS_DATA ./.
   cp ${WRFCHEM_DIR}/test/em_real/CAM_AEROPT_DATA ./.
   cp ${WRFCHEM_DIR}/test/em_real/ETAMPNEW_DATA ./.
   cp ${WRFCHEM_DIR}/test/em_real/GENPARM.TBL ./.
   cp ${WRFCHEM_DIR}/test/em_real/LANDUSE.TBL ./.
   cp ${WRFCHEM_DIR}/test/em_real/RRTMG_LW_DATA ./.
   cp ${WRFCHEM_DIR}/test/em_real/RRTMG_SW_DATA ./.
   cp ${WRFCHEM_DIR}/test/em_real/RRTM_DATA ./.
   cp ${WRFCHEM_DIR}/test/em_real/SOILPARM.TBL ./.
   cp ${WRFCHEM_DIR}/test/em_real/URBPARM.TBL ./.
   cp ${WRFCHEM_DIR}/test/em_real/VEGPARM.TBL ./.
   cp ${EXPERIMENT_HIST_IO_DIR}/hist_io_flds_v1 ./.
   cp ${EXPERIMENT_HIST_IO_DIR}/hist_io_flds_v2 ./.
   cp ${EXPERIMENT_HIST_IO_DIR}/hist_io_flds_v3 ./.
#
   cp ${EXPERIMENT_STATIC_FILES}/clim_p_trop.nc ./.
   cp ${EXPERIMENT_STATIC_FILES}/ubvals_b40.20th.track1_1996-2005.nc ./.
   cp ${EXO_COLDENS_DIR}/exo_coldens_d${CR_DOMAIN} ./.
   cp ${EXO_COLDENS_DIR}/exo_coldens_d${MR_DOMAIN} ./.
   cp ${EXO_COLDENS_DIR}/exo_coldens_d${FR_DOMAIN} ./.
   cp ${SEASONS_WES_DIR}/wrf_season_wes_usgs_d${CR_DOMAIN}.nc ./.
   cp ${SEASONS_WES_DIR}/wrf_season_wes_usgs_d${MR_DOMAIN}.nc ./.
   cp ${SEASONS_WES_DIR}/wrf_season_wes_usgs_d${FR_DOMAIN}.nc ./.
#
# Get WRF-Chem emissions files
   cp ${WRFCHEM_CHEM_EMISS_DIR}/wrfbiochemi_d${CR_DOMAIN}_${START_FILE_DATE}.${CLOSE_MEM_ID} wrfbiochemi_d${CR_DOMAIN}_${START_FILE_DATE}
   cp ${WRFCHEM_CHEM_EMISS_DIR}/wrfbiochemi_d${MR_DOMAIN}_${START_FILE_DATE}.${CLOSE_MEM_ID} wrfbiochemi_d${MR_DOMAIN}_${START_FILE_DATE}
   cp ${WRFCHEM_CHEM_EMISS_DIR}/wrfbiochemi_d${FR_DOMAIN}_${START_FILE_DATE}.${CLOSE_MEM_ID} wrfbiochemi_d${FR_DOMAIN}_${START_FILE_DATE}
#
   export L_DATE=${START_DATE}
   while [[ ${L_DATE} -le ${END_DATE} ]]; do
      export L_YY=`echo ${L_DATE} | cut -c1-4`
      export L_MM=`echo ${L_DATE} | cut -c5-6`
      export L_DD=`echo ${L_DATE} | cut -c7-8`
      export L_HH=`echo ${L_DATE} | cut -c9-10`
      export L_FILE_DATE=${L_YY}-${L_MM}-${L_DD}_${L_HH}:00:00
#
# files for starting from ensemble mean
#      cp ${WRFCHEM_FIRE_DIR}/wrffirechemi_d${CR_DOMAIN}_${L_FILE_DATE} wrffirechemi_d${CR_DOMAIN}_${L_FILE_DATE}
#      cp ${WRFCHEM_CHEMI_DIR}/wrfchemi_d${CR_DOMAIN}_${L_FILE_DATE} wrfchemi_d${CR_DOMAIN}_${L_FILE_DATE}
#      cp ${WRFCHEM_FIRE_DIR}/wrffirechemi_d${FR_DOMAIN}_${L_FILE_DATE} wrffirechemi_d${FR_DOMAIN}_${L_FILE_DATE}
#      cp ${WRFCHEM_CHEMI_DIR}/wrfchemi_d${FR_DOMAIN}_${L_FILE_DATE} wrfchemi_d${FR_DOMAIN}_${L_FILE_DATE}
#
# files for starting from closest member
      cp ${WRFCHEM_CHEM_EMISS_DIR}/wrffirechemi_d${CR_DOMAIN}_${L_FILE_DATE}.${CLOSE_MEM_ID} wrffirechemi_d${CR_DOMAIN}_${L_FILE_DATE}
      cp ${WRFCHEM_CHEM_EMISS_DIR}/wrfchemi_d${CR_DOMAIN}_${L_FILE_DATE}.${CLOSE_MEM_ID} wrfchemi_d${CR_DOMAIN}_${L_FILE_DATE}
      cp ${WRFCHEM_CHEM_EMISS_DIR}/wrffirechemi_d${MR_DOMAIN}_${L_FILE_DATE}.${CLOSE_MEM_ID} wrffirechemi_d${MR_DOMAIN}_${L_FILE_DATE}
      cp ${WRFCHEM_CHEM_EMISS_DIR}/wrfchemi_d${MR_DOMAIN}_${L_FILE_DATE}.${CLOSE_MEM_ID} wrfchemi_d${MR_DOMAIN}_${L_FILE_DATE}
      cp ${WRFCHEM_CHEM_EMISS_DIR}/wrffirechemi_d${FR_DOMAIN}_${L_FILE_DATE}.${CLOSE_MEM_ID} wrffirechemi_d${FR_DOMAIN}_${L_FILE_DATE}
      cp ${WRFCHEM_CHEM_EMISS_DIR}/wrfchemi_d${FR_DOMAIN}_${L_FILE_DATE}.${CLOSE_MEM_ID} wrfchemi_d${FR_DOMAIN}_${L_FILE_DATE}
#
      export L_DATE=$(${BUILD_DIR}/da_advance_time.exe ${L_DATE} +1 2>/dev/null)
   done
#
# Get WRF-Chem input and bdy files
#
#   cp ${REAL_DIR}/wrfout_d${CR_DOMAIN}_${START_FILE_DATE}_filt wrfinput_d${CR_DOMAIN}
#   cp ${REAL_DIR}/wrfbdy_d${CR_DOMAIN}_${START_FILE_DATE}_filt wrfbdy_d${CR_DOMAIN}
#   cp ${REAL_DIR}/wrfout_d${FR_DOMAIN}_${START_FILE_DATE}_filt wrfinput_d${FR_DOMAIN}
# 
##   cp ${WRFCHEM_CHEM_ICBC_DIR}/wrfinput_d${CR_DOMAIN}_${START_FILE_DATE} wrfinput_d${CR_DOMAIN}
##   cp ${WRFCHEM_CHEM_ICBC_DIR}/wrfbdy_d${CR_DOMAIN}_${START_FILE_DATE} wrfbdy_d${CR_DOMAIN}
##   cp ${WRFCHEM_CHEM_ICBC_DIR}/wrfinput_d${FR_DOMAIN}_${START_FILE_DATE} wrfinput_d${FR_DOMAIN}
#
# files for starting from closest member
   cp ${DART_FILTER_DIR}/wrfout_d${CR_DOMAIN}_${START_FILE_DATE}_filt.${CLOSE_MEM_ID} wrfinput_d${CR_DOMAIN}
   cp ${UPDATE_BC_DIR}/wrfbdy_d${CR_DOMAIN}_${START_FILE_DATE}_filt.${CLOSE_MEM_ID} wrfbdy_d${CR_DOMAIN}
   cp ${REAL_DIR}/wrfinput_d${MR_DOMAIN}_${START_FILE_DATE} wrfinput_d${MR_DOMAIN}
   cp ${REAL_DIR}/wrfinput_d${FR_DOMAIN}_${START_FILE_DATE} wrfinput_d${FR_DOMAIN}
#
# Create WRF-Chem namelist.input 
   export NL_MAX_DOM=3
   export NL_IOFIELDS_FILENAME=\'hist_io_flds_v1\',\'hist_io_flds_v2\',\'hist_io_flds_v3\'
   rm -rf namelist.input
   ${HYBRID_SCRIPTS_DIR}/da_create_wrfchem_namelist_nested_RT.ksh
#
   RANDOM=$$
   export JOBRND=${RANDOM}_wrf_cycle_mr
   ${HYBRID_SCRIPTS_DIR}/job_script_taki.ksh ${JOBRND} ${WRFCHEM_JOB_CLASS} ${WRFCHEM_TIME_LIMIT} ${WRFCHEM_NODES} ${WRFCHEM_TASKS} wrf.exe PARALLEL
   sbatch -W job.ksh
#
fi
#
#########################################################################
#
# RUN ENSMEAN_CYCLE_MR
#
#########################################################################
#
if ${RUN_ENSMEAN_CYCLE_MR}; then
   if [[ ! -d ${RUN_DIR}/${DATE}/ensmean_cycle_mr ]]; then
      mkdir -p ${RUN_DIR}/${DATE}/ensmean_cycle_mr
      cd ${RUN_DIR}/${DATE}/ensmean_cycle_mr
   else
      cd ${RUN_DIR}/${DATE}/ensmean_cycle_mr
   fi
#
# Get WRF-Chem parameter files
   if [[ ${RUN_FINE_SCALE_RESTART} = "false" ]]; then
      cp ${WRFCHEM_DIR}/test/em_real/wrf.exe ./.
      cp ${WRFCHEM_DIR}/test/em_real/aerosol.formatted ./.
      cp ${WRFCHEM_DIR}/test/em_real/aerosol_lat.formatted ./.
      cp ${WRFCHEM_DIR}/test/em_real/aerosol_lon.formatted ./.
      cp ${WRFCHEM_DIR}/test/em_real/aerosol_plev.formatted ./.
      cp ${WRFCHEM_DIR}/test/em_real/bulkdens.asc_s_0_03_0_9 ./.
      cp ${WRFCHEM_DIR}/test/em_real/bulkradii.asc_s_0_03_0_9 ./.
      cp ${WRFCHEM_DIR}/test/em_real/CAM_ABS_DATA ./.
      cp ${WRFCHEM_DIR}/test/em_real/CAM_AEROPT_DATA ./.
      cp ${WRFCHEM_DIR}/test/em_real/CAMtr_volume_mixing_ratio ./.
      cp ${WRFCHEM_DIR}/test/em_real/CAMtr_volume_mixing_ratio.A1B ./.
      cp ${WRFCHEM_DIR}/test/em_real/CAMtr_volume_mixing_ratio.A2 ./.
      cp ${WRFCHEM_DIR}/test/em_real/CAMtr_volume_mixing_ratio.RCP4.5 ./.
      cp ${WRFCHEM_DIR}/test/em_real/CAMtr_volume_mixing_ratio.RCP6 ./.
      cp ${WRFCHEM_DIR}/test/em_real/capacity.asc ./.
      cp ${WRFCHEM_DIR}/test/em_real/CCN_ACTIVATE.BIN ./.
      cp ${WRFCHEM_DIR}/test/em_real/CLM_ALB_ICE_DFS_DATA ./.
      cp ${WRFCHEM_DIR}/test/em_real/CLM_ALB_ICE_DRC_DATA ./.
      cp ${WRFCHEM_DIR}/test/em_real/CLM_ASM_ICE_DFS_DATA ./.
      cp ${WRFCHEM_DIR}/test/em_real/CLM_ASM_ICE_DRC_DATA ./.
      cp ${WRFCHEM_DIR}/test/em_real/CLM_DRDSDT0_DATA ./.
      cp ${WRFCHEM_DIR}/test/em_real/CLM_EXT_ICE_DFS_DATA ./.
      cp ${WRFCHEM_DIR}/test/em_real/CLM_EXT_ICE_DRC_DATA ./.
      cp ${WRFCHEM_DIR}/test/em_real/CLM_KAPPA_DATA ./.
      cp ${WRFCHEM_DIR}/test/em_real/CLM_TAU_DATA ./.
      cp ${WRFCHEM_DIR}/test/em_real/coeff_p.asc ./.
      cp ${WRFCHEM_DIR}/test/em_real/coeff_q.asc ./.
      cp ${WRFCHEM_DIR}/test/em_real/constants.asc ./.
      cp ${WRFCHEM_DIR}/test/em_real/ETAMPNEW_DATA ./.
      cp ${WRFCHEM_DIR}/test/em_real/ETAMPNEW_DATA.expanded_rain ./.
      cp ${WRFCHEM_DIR}/test/em_real/GENPARM.TBL ./.
      cp ${WRFCHEM_DIR}/test/em_real/grib2map.tbl ./.
      cp ${WRFCHEM_DIR}/test/em_real/gribmap.txt ./.
      cp ${WRFCHEM_DIR}/test/em_real/kernels.asc_s_0_03_0_9 ./.
      cp ${WRFCHEM_DIR}/test/em_real/kernels_z.asc ./.
      cp ${WRFCHEM_DIR}/test/em_real/LANDUSE.TBL ./.
      cp ${WRFCHEM_DIR}/test/em_real/masses.asc ./.
      cp ${WRFCHEM_DIR}/test/em_real/MPTABLE.TBL ./.
      cp ${WRFCHEM_DIR}/test/em_real/ozone.formatted ./.
      cp ${WRFCHEM_DIR}/test/em_real/ozone_lat.formatted ./.
      cp ${WRFCHEM_DIR}/test/em_real/ozone_plev.formatted ./.
      cp ${WRFCHEM_DIR}/test/em_real/RRTM_DATA ./.
      cp ${WRFCHEM_DIR}/test/em_real/RRTMG_LW_DATA ./.
      cp ${WRFCHEM_DIR}/test/em_real/RRTMG_SW_DATA ./.
      cp ${WRFCHEM_DIR}/test/em_real/SOILPARM.TBL ./.
      cp ${WRFCHEM_DIR}/test/em_real/termvels.asc ./.
      cp ${WRFCHEM_DIR}/test/em_real/tr49t67 ./.
      cp ${WRFCHEM_DIR}/test/em_real/tr49t85 ./.
      cp ${WRFCHEM_DIR}/test/em_real/tr67t85 ./.
      cp ${WRFCHEM_DIR}/test/em_real/URBPARM.TBL ./.
      cp ${WRFCHEM_DIR}/test/em_real/VEGPARM.TBL ./.
      cp ${EXPERIMENT_HIST_IO_DIR}/hist_io_flds_v1 ./.
      cp ${EXPERIMENT_HIST_IO_DIR}/hist_io_flds_v2 ./.
      cp ${EXPERIMENT_HIST_IO_DIR}/hist_io_flds_v3 ./.
#     
      cp ${EXPERIMENT_STATIC_FILES}/clim_p_trop.nc ./.
      cp ${EXPERIMENT_STATIC_FILES}/ubvals_b40.20th.track1_1996-2005.nc ./.
      cp ${EXO_COLDENS_DIR}/exo_coldens_d${CR_DOMAIN} ./.
      cp ${EXO_COLDENS_DIR}/exo_coldens_d${MR_DOMAIN} ./.
      cp ${EXO_COLDENS_DIR}/exo_coldens_d${FR_DOMAIN} ./.
      cp ${SEASONS_WES_DIR}/wrf_season_wes_usgs_d${CR_DOMAIN}.nc ./.
      cp ${SEASONS_WES_DIR}/wrf_season_wes_usgs_d${MR_DOMAIN}.nc ./.
      cp ${SEASONS_WES_DIR}/wrf_season_wes_usgs_d${FR_DOMAIN}.nc ./.
#
# Get WRF-Chem emissions files
      cp ${WRFCHEM_BIO_DIR}/wrfbiochemi_d${CR_DOMAIN}_${START_FILE_DATE} wrfbiochemi_d${CR_DOMAIN}_${START_FILE_DATE}
      cp ${WRFCHEM_BIO_DIR}/wrfbiochemi_d${MR_DOMAIN}_${START_FILE_DATE} wrfbiochemi_d${MR_DOMAIN}_${START_FILE_DATE}
      cp ${WRFCHEM_BIO_DIR}/wrfbiochemi_d${FR_DOMAIN}_${START_FILE_DATE} wrfbiochemi_d${FR_DOMAIN}_${START_FILE_DATE}
#
#      cp ${WRFCHEM_CHEM_EMISS_DIR}/wrfbiochemi_d${CR_DOMAIN}_${START_FILE_DATE}.${CLOSE_MEM_ID} wrfbiochemi_d${CR_DOMAIN}_${START_FILE_DATE}
#      cp ${WRFCHEM_CHEM_EMISS_DIR}/wrfbiochemi_d${FR_DOMAIN}_${START_FILE_DATE}.${CLOSE_MEM_ID} wrfbiochemi_d${FR_DOMAIN}_${START_FILE_DATE}
#
      export L_DATE=${START_DATE}
      while [[ ${L_DATE} -le ${END_DATE} ]]; do
         export L_YY=`echo ${L_DATE} | cut -c1-4`
         export L_MM=`echo ${L_DATE} | cut -c5-6`
         export L_DD=`echo ${L_DATE} | cut -c7-8`
         export L_HH=`echo ${L_DATE} | cut -c9-10`
         export L_FILE_DATE=${L_YY}-${L_MM}-${L_DD}_${L_HH}:00:00
         cp ${WRFCHEM_FIRE_DIR}/wrffirechemi_d${CR_DOMAIN}_${L_FILE_DATE} wrffirechemi_d${CR_DOMAIN}_${L_FILE_DATE}
         cp ${WRFCHEM_CHEMI_DIR}/wrfchemi_d${CR_DOMAIN}_${L_FILE_DATE} wrfchemi_d${CR_DOMAIN}_${L_FILE_DATE}
         cp ${WRFCHEM_FIRE_DIR}/wrffirechemi_d${MR_DOMAIN}_${L_FILE_DATE} wrffirechemi_d${MR_DOMAIN}_${L_FILE_DATE}
         cp ${WRFCHEM_CHEMI_DIR}/wrfchemi_d${MR_DOMAIN}_${L_FILE_DATE} wrfchemi_d${MR_DOMAIN}_${L_FILE_DATE}
         cp ${WRFCHEM_FIRE_DIR}/wrffirechemi_d${FR_DOMAIN}_${L_FILE_DATE} wrffirechemi_d${FR_DOMAIN}_${L_FILE_DATE}
         cp ${WRFCHEM_CHEMI_DIR}/wrfchemi_d${FR_DOMAIN}_${L_FILE_DATE} wrfchemi_d${FR_DOMAIN}_${L_FILE_DATE}
#     
#         cp ${WRFCHEM_CHEM_EMISS_DIR}/wrffirechemi_d${CR_DOMAIN}_${L_FILE_DATE}.${CLOSE_MEM_ID} wrffirechemi_d${CR_DOMAIN}_${L_FILE_DATE}
#         cp ${WRFCHEM_CHEM_EMISS_DIR}/wrfchemi_d${CR_DOMAIN}_${L_FILE_DATE}.${CLOSE_MEM_ID} wrfchemi_d${CR_DOMAIN}_${L_FILE_DATE}
#         cp ${WRFCHEM_CHEM_EMISS_DIR}/wrffirechemi_d${FR_DOMAIN}_${L_FILE_DATE}.${CLOSE_MEM_ID} wrffirechemi_d${FR_DOMAIN}_${L_FILE_DATE}
#         cp ${WRFCHEM_CHEM_EMISS_DIR}/wrfchemi_d${FR_DOMAIN}_${L_FILE_DATE}.${CLOSE_MEM_ID} wrfchemi_d${FR_DOMAIN}_${L_FILE_DATE}
         export L_DATE=$(${BUILD_DIR}/da_advance_time.exe ${L_DATE} +1 2>/dev/null)
      done
#
# Get WR-Chem input and bdy files
#      cp ${REAL_DIR}/wrfout_d${CR_DOMAIN}_${START_FILE_DATE}_filt wrfinput_d${CR_DOMAIN}
#      cp ${REAL_DIR}/wrfbdy_d${CR_DOMAIN}_${START_FILE_DATE}_filt wrfbdy_d${CR_DOMAIN}
#      cp ${REAL_DIR}/wrfout_d${FR_DOMAIN}_${START_FILE_DATE}_filt wrfinput_d${FR_DOMAIN}
#      cp ${DART_FILTER_DIR}/wrfout_d${CR_DOMAIN}_${START_FILE_DATE}_filt.${CLOSE_MEM_ID} wrfinput_d${CR_DOMAIN}
#      cp ${UPDATE_BC_DIR}/wrfbdy_d${CR_DOMAIN}_${START_FILE_DATE}_filt.${CLOSE_MEM_ID} wrfbdy_d${CR_DOMAIN}
#      cp ${REAL_DIR}/wrfinput_d${FR_DOMAIN}_${START_FILE_DATE} wrfinput_d${FR_DOMAIN}
      cp ${ENSEMBLE_MEAN_INPUT_DIR}/wrfbdy_d${CR_DOMAIN}_mean wrfbdy_d${CR_DOMAIN}
      cp ${ENSEMBLE_MEAN_INPUT_DIR}/wrfinput_d${CR_DOMAIN}_mean wrfinput_d${CR_DOMAIN}
      cp ${ENSEMBLE_MEAN_INPUT_DIR}/wrfinput_d${MR_DOMAIN}_mean wrfinput_d${MR_DOMAIN}
      cp ${ENSEMBLE_MEAN_INPUT_DIR}/wrfinput_d${FR_DOMAIN}_mean wrfinput_d${FR_DOMAIN}
   fi
#
# Create WRF-Chem namelist.input 
   export NL_MAX_DOM=3
   export NL_IOFIELDS_FILENAME=\'hist_io_flds_v1\',\'hist_io_flds_v2\',\'hist_io_flds_v2\'
   export NL_RESTART_INTERVAL=360
   export NL_TIME_STEP=40
   export NL_BIOEMDT=1,.5,0.25
   export NL_PHOTDT=1,.5,0.25
   export NL_CHEMDT=1,.5,0.25
   export L_TIME_LIMIT=${WRFCHEM_TIME_LIMIT}
   if [[ ${RUN_FINE_SCALE_RESTART} = "true" ]]; then
      export RE_YYYY=$(echo $RESTART_DATE | cut -c1-4)
      export RE_YY=$(echo $RESTART_DATE | cut -c3-4)
      export RE_MM=$(echo $RESTART_DATE | cut -c5-6)
      export RE_DD=$(echo $RESTART_DATE | cut -c7-8)
      export RE_HH=$(echo $RESTART_DATE | cut -c9-10)
      export NL_START_YEAR=${RE_YYYY},${RE_YYYY}
      export NL_START_MONTH=${RE_MM},${RE_MM}
      export NL_START_DAY=${RE_DD},${RE_DD}
      export NL_START_HOUR=${RE_HH},${RE_HH}
      export NL_START_MINUTE=00,00
      export NL_START_SECOND=00,00
      export NL_RESTART=".true."
      export L_TIME_LIMIT=${WRFCHEM_TIME_LIMIT}
   fi
   rm -rf namelist.input
   ${HYBRID_SCRIPTS_DIR}/da_create_wrfchem_namelist_nested_RT.ksh
#
   RANDOM=$$
   export JOBRND=${RANDOM}_wrf_ensem_mr
   ${HYBRID_SCRIPTS_DIR}/job_script_taki.ksh ${JOBRND} ${WRFCHEM_JOB_CLASS} ${WRFCHEM_TIME_LIMIT} ${WRFCHEM_NODES} ${WRFCHEM_TASKS} wrf.exe PARALLEL
   sbatch -W job.ksh
fi
#
#########################################################################
#
# CALCULATE ENSEMBLE MEAN_OUTPUT
#
#########################################################################
#
if ${RUN_ENSEMBLE_MEAN_OUTPUT}; then
   if [[ ! -d ${RUN_DIR}/${DATE}/ensemble_mean_output ]]; then
      mkdir -p ${RUN_DIR}/${DATE}/ensemble_mean_output
      cd ${RUN_DIR}/${DATE}/ensemble_mean_output
   else
      cd ${RUN_DIR}/${DATE}/ensemble_mean_output
   fi
   if [[ ${DATE} -eq ${INITIAL_DATE} ]]; then
      export OUTPUT_DIR_CR=${WRFCHEM_INITIAL_DIR}
      export OUTPUT_DIR_MR=${WRFCHEM_INITIAL_DIR}
   else
      export OUTPUT_DIR_CR=${WRFCHEM_CYCLE_CR_DIR}
      export OUTPUT_DIR_MR=${WRFCHEM_CYCLE_MR_DIR}
   fi
   rm -rf wrfout_d${CR_DOMAIN}_*
   rm -rf wrfout_d${MR_DOMAIN}_*
   export P_DATE=${DATE}
   export P_END_DATE=$(${BUILD_DIR}/da_advance_time.exe ${P_DATE} ${FCST_PERIOD} 2>/dev/null)
   while [[ ${P_DATE} -le ${P_END_DATE} ]] ; do
      export P_YYYY=$(echo $P_DATE | cut -c1-4)
      export P_MM=$(echo $P_DATE | cut -c5-6)
      export P_DD=$(echo $P_DATE | cut -c7-8)
      export P_HH=$(echo $P_DATE | cut -c9-10)
      export P_FILE_DATE=${P_YYYY}-${P_MM}-${P_DD}_${P_HH}:00:00
      let MEM=1
      while [[ ${MEM} -le ${NUM_MEMBERS} ]]; do
         export CMEM=e${MEM}
         export KMEM=${MEM}
         if [[ ${MEM} -lt 1000 ]]; then export KMEM=0${MEM}; fi
         if [[ ${MEM} -lt 100 ]]; then export KMEM=00${MEM}; export CMEM=e0${MEM}; fi
         if [[ ${MEM} -lt 10 ]]; then export KMEM=000${MEM}; export CMEM=e00${MEM}; fi
         rm -rf wrfout_d${CR_DOMAIN}_${KMEM}
         rm -rf wrfout_d${MR_DOMAIN}_${KMEM}
         ln -sf ${OUTPUT_DIR_CR}/run_${CMEM}/wrfout_d${CR_DOMAIN}_${P_FILE_DATE} wrfout_d${CR_DOMAIN}_${KMEM}
         ln -sf ${OUTPUT_DIR_MR}/run_${CMEM}/wrfout_d${MR_DOMAIN}_${P_FILE_DATE} wrfout_d${MR_DOMAIN}_${KMEM}
         let MEM=${MEM}+1
      done
#      cp ${OUTPUT_DIR}/run_e001/wrfout_d${CR_DOMAIN}_${P_FILE_DATE} wrfout_d${CR_DOMAIN}_${P_DATE}_mean
#
# Calculate ensemble mean
      ncea -n ${NUM_MEMBERS},4,1 wrfout_d${CR_DOMAIN}_0001 wrfout_d${CR_DOMAIN}_${P_DATE}_mean
      ncea -n ${NUM_MEMBERS},4,1 wrfout_d${MR_DOMAIN}_0001 wrfout_d${MR_DOMAIN}_${P_DATE}_mean
      export P_DATE=$(${BUILD_DIR}/da_advance_time.exe ${P_DATE} ${HISTORY_INTERVAL_HR} 2>/dev/null)
   done
fi
export CYCLE_DATE=${NEXT_DATE}
done
#