connection: "capacitacion_looker_data"

# include all the views
include: "/views/**/*.view"

datagroup: prueba_ntt_aq_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: prueba_ntt_aq_default_datagroup

explore: lr_ac3_hi1660229404250_del_pasivas_empresas_vw {}

explore: fct_cartera_activa {}

explore: fct_detalle_comisiones {}

explore: connection_reg_r3 {}

explore: agr_saldos_fci {}

explore: agr_situacion_cartera {}

explore: fct_situaciones_plan_sueldos {}

explore: agr_promedios_pasivos {}

explore: lkp_agrupacion_comisiones {}

explore: lkp_bancas {}

explore: lkp_capitas_plan_sueldo {}

explore: lkp_cuentas {}

explore: lkp_causales {}

explore: lkp_clientes_completa {}

explore: lkp_especies {}

explore: lkp_estado_deuda {}

explore: lkp_fechas {}

explore: lkp_estados_ps {}

explore: lkp_periodos_transformacion {}

explore: lkp_grupos_comisiones {}

explore: lkp_sucursales_radicacion {}

explore: lkp_oficiales_cuentas {}

explore: lkp_productos {}

explore: lkp_plan_cuentas {}
