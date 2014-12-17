$(document).ready(function() {
    $('#registrationForm').bootstrapValidator({
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
			pid: {
                validators: {
                    notEmpty: {
                    },
                    regexp: {
                        regexp: /^\d $/,
                        message: 'The US zipcode must contain 5 digits'
					}
                }
            },
            name: {
                validators: {
                    notEmpty: {
                    },
                    stringLength: {
                        max: 30
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9]+$/
                    }
                }
            },
            email: {
                validators: {
                    notEmpty: {
                    },
                    emailAddress: {
                    }
                }
            },
			phone: {
                validators: {
                    notEmpty: {
                    },
                    phone:{
					}
                }
            },
			address: {
                validators: {
                    notEmpty: {
                    },
                    Address: {
                    }
                }
            },
			zip: {
                validators: {
                    notEmpty: {
                    },
                    regexp: {
                        regexp: /^\d{5}$/,
                        message: 'The US zipcode must contain 5 digits'
                    }
                }
            },
            birthday: {
                validators: {
                    notEmpty: {
                    },
                    date: {
                        format: 'YYYY/MM/DD'
                    }
                }
            },
            gender: {
                validators: {
                    notEmpty: {
                    }
                }
            }
        }
    });
});