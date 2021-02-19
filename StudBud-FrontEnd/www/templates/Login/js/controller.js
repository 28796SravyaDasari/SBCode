appControllers.controller('loginCtrl', function ($scope,$rootScope, $mdToast, $http, $ionicPopup, $ionicLoading, $filter,$cordovaGeolocation,$state) {
  
    $scope.login = function (logon)  {

        if (logon.UserId == null || logon.UserId == undefined || logon.UserId == '') {
             $scope.showAlert('Error','Please Enter Userid')
            return;
        }
        if (logon.Password == null || logon.Password == undefined || logon.Password == '') {
             $scope.showAlert('Error','Please Enter Password')
            return;
        }

        $ionicLoading.show({
            content: 'Loading'
            , animation: 'fade-in'
            , showBackdrop: true
            , maxWidth: 200
            , template: 'Loading..'
            , showDelay: 0
        });
        $scope.identity=''
        window.plugins.OneSignal.getIds(function (ids) {
            $scope.identity = JSON.stringify(ids['userId'])
           
            var data = {
                Type: 'TeacherLogin',
                UserId: logon.UserId,
                Password: logon.Password,
                AndroidToken: $scope.identity
            }
            $http({
                method: 'post'
                , url: 'http://yasheshbharti.com/api/TeacherStudLogin'
                , data: data
            }).then(function successCallback(response) {
                if (response.data.length == 0) {
                    $scope.showAlert('Error', 'Login Failed. Please try again with valid credentials.')
                } else {
                    //$scope.getLocation(logon.UserId)

                    //setInterval(function () {
                    //    $scope.getLocation(localStorage.getItem('Loginid'));
                    //}, 10000);
                    console.log(response.data)
                    localStorage.setItem('Loginid', logon.UserId)
                    localStorage.setItem('TeacherId', response.data[0].id)
                    localStorage.setItem('TeacherName', response.data[0].name)
                    localStorage.setItem('FromDate', response.data[0].fromdate)
                    localStorage.setItem('ToDate', response.data[0].todate)
                    localStorage.setItem('phoneno', response.data[0].phoneno)
                    localStorage.setItem('courseId', response.data[0].courseId)
                    localStorage.setItem('privilege', response.data[0].privilege)
                    
                    var pri = response.data[0].privilege
                    $rootScope.canAddAttendance = (pri.indexOf("1") != -1 ? true : false)
                    $rootScope.canEditTimeTable = (pri.indexOf("2") != -1 ? true : false)
                    $rootScope.canCreateNotice = (pri.indexOf("3") != -1 ? true : false)
                    $rootScope.canSetAutoDefaulter = (pri.indexOf("4") != -1 ? true : false)
                    $rootScope.canApproveList = (pri.indexOf("5") != -1 ? true : false)
                    

                    //window.plugins.OneSignal.sendTag("course", response.data[0].courseId);

                    $rootScope.TeacherName = localStorage.getItem('TeacherName')
                    $rootScope.isLoggedIn = true
                    $state.go('app.home')
                }
                $ionicLoading.hide();
            }, function errorCallback(response) {
                $ionicLoading.hide();
                // called asynchronously if an error occurs
                // or server returns response with an error status.
            });
        });

        
    }

    $scope.sendPassword = function () { 
    }

    $scope.showAlert=function(title,content){
        $ionicPopup.alert({
                    title: title,
                    content: content
                }).then(function (res) {

                });
    }

    //$scope.getLocation = function (loginId) {

    //    var posOptions = {
    //        timeout: 10000,
    //        enableHighAccuracy: false
    //    }
    //    $cordovaGeolocation.getCurrentPosition(posOptions)
    //        .then(function (position) {
    //            var data = {
    //                Type: 'UpdateTeacherLocation',
    //                TeacherId: loginId,
    //                Lati: position.coords.latitude,
    //                Longi: position.coords.longitude
    //            };

    //            $http({
    //                method: 'post',
    //                url: 'http://yasheshbharti.com/api/StudentMaster',
    //                data: data
    //            }).then(function successCallback(response) {

    //            }, function errorCallback(response) {

    //            });
    //            console.log(data)

    //        }, function (err) {
    //            console.log(err)
    //            //alert(err.message)
    //        })
    //}
    
    $scope.sendMsg = function (mobileno, password) {
        var msg = 'Your password is ' + password;
//        var url = "http://nimbusit.net/api.php?username=t4shwetankrdwivedi&password=947092&sender=RBTECH&sendto="+ mobileno+"&message=" + msg;   
       
        var url = " http://trans.smsfresh.co/api/sendmsg.php?user=studbud&pass=123456&sender=STUDBD&phone=" + mobileno +"&text=" + msg + "&priority=ndnd&stype=normal";  
        try {
            $http.jsonp(url).
                success(function (data, status, headers, config) {
                    console.log(data)
                }).
                error(function (data, status, headers, config) {
                    $scope.error = true;
                });
        } catch (e) {
            $scope.showAlert(data, 'Your password has been sent to your register mobile number.')
        }
    }

    $scope.forgotPassword = function (rollno) {
        var rollLength = 0
        try {
            rollLength = rollno.length
        }
        catch (e) {
            $scope.showAlert('Error', 'Please Enter your Unique Id')
            return;
        }

        if (rollLength > 0) {
            var data = {
                Flag: 'forgotPasswordTeacher',
                TeacherId: rollno
            }
            $http({
                method: 'post'
                , url: 'http://yasheshbharti.com/api/GetDetails'
                , data: data
            }).then(function successCallback(response) {
                if (response.data.length == 0) {
                    $scope.showAlert('Error', 'Invalid Username.')
                } else {
                    $scope.sendMsg(response.data[0].phoneno, response.data[0].password)
                    $scope.showAlert('Success', 'Your Password has been sent to your registered mobile number.')
                }

            }, function errorCallback(response) {

            });
        }
        else {
            $scope.showAlert('Error', 'Please Enter Enrollment Number')
        }
    }

})