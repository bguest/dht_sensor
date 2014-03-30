// Include the Ruby headers and goodies
#include "ruby.h"
#include "dhtreader.h"

// Defining a space for information and references about the class to be stored internally
VALUE DhtSensor = Qnil;

// Prototype for the initialization method - Ruby calls this, not you
void Init_dht_sensor();

// Prototype for our methods - methods are prefixed by 'method_' here
VALUE method_initialize(VALUE self, VALUE type, VALUE pin);
VALUE method_to_a(VALUE self);

// The initialization method for this module
void Init_dht_sensor() {
  DhtSensor = rb_define_class("DhtSensor", rb_cObject);
  rb_define_method(DhtSensor, "initialize", method_initialize, 2);
  rb_define_method(DhtSensor, "to_a", method_to_a, 0);
}

VALUE method_initialize(VALUE self, VALUE type, VALUE pin){
  ID id_type = rb_intern("type");
  ID id_pin =  rb_intern("pin");

  rb_ivar_set(self, id_type, type);
  rb_ivar_set(self, id_pin, pin);

  bcm2835_init();

  return self;
}

VALUE method_to_a(VALUE self){
  float temp, hum;
  int type_i, pin_i;
  VALUE return_array, temperature, humidity;

  ID id_type = rb_intern("type");
  ID id_pin =  rb_intern("pin");

  type_i = NUM2INT(rb_ivar_get(self, id_type));
  pin_i  = NUM2INT(rb_ivar_get(self, id_pin));

  readDHT(type_i, pin_i, &temp, &hum);

  return_array = rb_ary_new2(2);
  temperature = DBL2NUM(temp);
  humidity    = DBL2NUM(hum);
  rb_ary_push(return_array, temperature);
  rb_ary_push(return_array, humidity);
  return return_array;
}
