view: agr_situacion_cartera {
  sql_table_name: `LOOKER.agr_situacion_cartera`
    ;;

  dimension: banca_comite_key {
    type: number
    sql: ${TABLE}.Banca_Comite_Key ;;
  }

  dimension: banco_key {
    type: number
    sql: ${TABLE}.Banco_Key ;;
  }

  dimension: cliente_key {
    type: number
    sql: ${TABLE}.Cliente_Key ;;
  }

  dimension: especie_key {
    type: number
    sql: ${TABLE}.Especie_Key ;;
  }

  dimension: estado_deuda_key {
    type: number
    sql: ${TABLE}.Estado_Deuda_Key ;;
  }

  dimension: fecha_key {
    type: number
    sql: ${TABLE}.Fecha_Key ;;
  }

  dimension: oficial_cuenta_key {
    type: number
    sql: ${TABLE}.Oficial_Cuenta_Key ;;
  }

  dimension: origen {
    type: string
    sql: ${TABLE}.Origen ;;
  }

  dimension: producto_key {
    type: number
    sql: ${TABLE}.Producto_Key ;;
  }

  dimension: saldo {
    type: number
    sql: ${TABLE}.Saldo ;;
  }

  dimension: saldo_promedio_mes {
    type: number
    sql: ${TABLE}.Saldo_Promedio_Mes ;;
  }

  dimension: sector_key {
    type: number
    sql: ${TABLE}.Sector_key ;;
  }

  dimension: sucursal_radicacion_key {
    type: number
    sql: ${TABLE}.Sucursal_Radicacion_Key ;;
  }

  dimension: clasificacion_producto {
    case: {
      when: {
        sql: (( ${TABLE}.Familia_Productos in ( 'Cuenta Corriente' ) and  ${TABLE}.Tipo_Producto not in ( 'Utilización Fondo Unificado' ) )
            or( ${TABLE}.Familia_Productos in ( 'Adelantos en Cuenta Corriente','Otros Adelantos' ) )
            or( ${TABLE}.Producto_Source in ( '089713','FIMPO89713' ) and  ${TABLE}.Familia_Productos = 'Comercio Exterior') );;
        label: "Adelantos en Cuenta Corriente y Otros Adelantos"
      }

      when: {
        sql: (( ${TABLE}.Tipo_Producto not in ( 'A Determinar' ,'Servicios') and  ${TABLE}.Producto_Source not in ( '089713','FIMPO89713','DEUCOMEXD','DEUCOMEXP' ) and  ${TABLE}.Familia_Productos = 'Comercio Exterior')
          or( ${TABLE}.Familia_Productos = 'Cartera Documentada' and  ${TABLE}.Tipo_Producto = 'Sola Firma' and  ${TABLE}.Producto_Source not like '(RI)%'));;
        label: "Comercio Exterior" ##Documentos a Sola Firma
      }

      when: {
        sql: (${TABLE}.Familia_Productos = 'Cartera Documentada' and  ${TABLE}.Tipo_Producto in ( 'Documentos Comprados','Documentos Descontados','Documentos Descontados (RECA)','Otros Préstamos Documentados' ));;
        label: "Documentos Descontados y Comprados"
      }

      when: {
        sql: ( ${TABLE}.Familia_Productos in ( 'Hipotecario','Hipotecarios' ) );;
        label: "Préstamos Hipotecarios"
      }

      when: {
        sql: (${TABLE}.Familia_Productos in ( 'Otros Préstamos','Call Otorgado' ) or  ${TABLE}.Producto_Source in( 'DEUCOMEXD','DEUCOMEXP' ) );;
        label: "Otros Préstamos"
      }

      when: {
        sql: (( ${TABLE}.Familia_Productos in ( 'Personales' ) and  ${TABLE}.Producto_Source not like '(A)%') );;
        label: "Préstamos Personales"
      }

      when: {
        sql: (  ${TABLE}.Familia_Productos in ( 'Prendarios','Prendario' ));;
        label: "Préstamos Prendarios"
      }

      when: {
        sql: (  ${TABLE}.Familia_Productos in ( 'Bienes en Locación Financiera' ) or( ${TABLE}.Familia_Productos in( 'OCIF' ) and  ${TABLE}.Producto_Source in ( 'PREBIELO','PREBIELO90' ) ) );;
        label: "Leasing"
      }

      else: "Sin_Clasificar"


    }

  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: saldo_sum {
    type: sum
    value_format: "#,##0,,\" M\""
    sql:  ${TABLE}.Saldo ;;
  }

  measure: saldo_promedio_mes_sum {
    type: sum
    value_format: "#,##0,,\" M\""
    sql:  ${TABLE}.Saldo_promedio_mes;;
  }


}
