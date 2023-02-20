class RespuestaUtilityModel {

  bool          error;
  String        mensaje;
  bool          tokenExpirado; 

  RespuestaUtilityModel(
    {
      this.error = false,
      this.mensaje = '',
      this.tokenExpirado = false
    }
  );

}