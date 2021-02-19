// Controller of menu toggle.
// Learn more about Sidenav directive of angular material
// https://material.angularjs.org/latest/#/demo/material.components.sidenav
appControllers.controller('menuCtrl', function ($scope, $rootScope, $timeout, $mdUtil, $mdSidenav, $log, $ionicHistory, $state, $ionicPlatform, $mdDialog, $mdBottomSheet, $mdMenu, $mdSelect, $ionicPopup, $http,$ionicModal) {
    
    if (localStorage.getItem('Loginid') == undefined || localStorage.getItem('Loginid') == null || localStorage.getItem('Loginid') == '') {
        $rootScope.isLoggedIn = false
    }
    else {
        $rootScope.isLoggedIn=true
    }
   
   $ionicModal.fromTemplateUrl('templates/custom.html', {
        scope: $scope
    }).then(function (modal) {
        $scope.modalCust = modal;
    });



    // Triggered in the login modal to close it
    $scope.closeLogin = function () {
        $scope.modalCust.hide();
    };
        // Open the login modal
    $scope.openPop = function () {
        $scope.modalCust.show();
    };


    $scope.showAlert = function (title, content) {
        $ionicPopup.alert({
            title: title,
            content: content
        }).then(function (res) {

        });
    }

    $scope.changePass = function (oldpass, newpass) {
        var data = {
            Flag: 'ChangeTechrPassword',
            TeacherId: localStorage.getItem('Loginid'),
            OldPassword: oldpass,
            NewPassword: newpass
        }

        $http({
            method: 'post'
            , url: 'http://yasheshbharti.com/api/UpdateDetails'
            , data: data
        }).then(function successCallback(response) {
            $scope.showAlert('Message', response.data[0].Msg)
            $scope.closeLogin()
        }, function errorCallback(response) {
$scope.closeLogin()
        });
    }

    $scope.openChngPassPopUp = function () {
        
        var myPopup = $ionicPopup.show({
            //template: '<input type="text" id="replyText" ng-model="reply">',
            template: '<input type="text" ng-model="reply" id="oldpass" placeholder="Old Password">' +
                '</br>' +
                '<input type="text" ng-model="replyy" id="newpass" placeholder="New Password">',
            title: 'Change Password',
            scope: $scope,
            buttons: [
              { text: 'Cancel' },
              {
                  text: '<b>Change</b>',
                  type: 'button-positive',
                  onTap: function (e) {
                      var oldpass = document.getElementById('oldpass').value
                      var newpass = document.getElementById('newpass').value
                      if (oldpass.length > 0 && newpass.length > 0) {
                          $scope.changePass(oldpass, newpass);
                      } else {
                          //alert($scope.reply)
                          return $scope.reply;
                      }
                  }
              }
            ]
        });

        myPopup.then(function (res) {
            console.log('Tapped!', res);
        });
    }

    $scope.askChngPassPermi = function () {
        var confirmPopup = $ionicPopup.confirm({
            title: 'Change Password',
            template: 'Are you sure you want to change your password.'
            //'<a ng-repeat="item in ' + angular.element($scope.EvntStudents).serialize() + '">bgf</a>'
        });
        confirmPopup.then(function (res) {
            if (res) {
                //$scope.openChngPassPopUp();
                $scope.openPop()
            } else {
                console.log('You are not sure');
            }
        });
    }



    $scope.toggleLeft = buildToggler('left');

    // buildToggler is for create menu toggle.
    // Parameter :  
    // navID = id of navigation bar.
    function buildToggler(navID) {
        var debounceFn = $mdUtil.debounce(function () {
            $mdSidenav(navID).toggle();
        }, 0);
        return debounceFn;
    };// End buildToggler.

    // navigateTo is for navigate to other page 
    // by using targetPage to be the destination state. 
    // Parameter :  
    // stateNames = target state to go
    $scope.navigateTo = function (stateName) {
        $timeout(function () {
            $mdSidenav('left').close();
            if ($ionicHistory.currentStateName() != stateName) {
                $ionicHistory.nextViewOptions({
                    disableAnimate: true,
                    disableBack: true
                });
                if (stateName == 'app.logout') {
                    localStorage.clear();
                    $state.go('app.login');
                } else {
                    $state.go(stateName);
                }
            }
        }, ($scope.isAndroid == false ? 300 : 0));
    };// End navigateTo.

    //closeSideNav is for close side navigation
    //It will use with event on-swipe-left="closeSideNav()" on-drag-left="closeSideNav()"
    //When user swipe or drag md-sidenav to left side
    $scope.closeSideNav = function(){
        $mdSidenav('left').close();
    };
    //End closeSideNav

    //  $ionicPlatform.registerBackButtonAction(callback, priority, [actionId])
    //
    //     Register a hardware back button action. Only one action will execute
    //  when the back button is clicked, so this method decides which of
    //  the registered back button actions has the highest priority.
    //
    //     For example, if an actionsheet is showing, the back button should
    //  close the actionsheet, but it should not also go back a page view
    //  or close a modal which may be open.
    //
    //  The priorities for the existing back button hooks are as follows:
    //  Return to previous view = 100
    //  Close side menu         = 150
    //  Dismiss modal           = 200
    //  Close action sheet      = 300
    //  Dismiss popup           = 400
    //  Dismiss loading overlay = 500
    //
    //  Your back button action will override each of the above actions
    //  whose priority is less than the priority you provide. For example,
    //  an action assigned a priority of 101 will override the ‘return to
    //  previous view’ action, but not any of the other actions.
    //
    //  Learn more at : http://ionicframework.com/docs/api/service/$ionicPlatform/#registerBackButtonAction

    $ionicPlatform.registerBackButtonAction(function(){

        if($mdSidenav("left").isOpen()){
            //If side navigation is open it will close and then return
            $mdSidenav('left').close();
        }
        else if(jQuery('md-bottom-sheet').length > 0 ) {
            //If bottom sheet is open it will close and then return
            $mdBottomSheet.cancel();
        }
        else if(jQuery('[id^=dialog]').length > 0 ){
            //If popup dialog is open it will close and then return
            $mdDialog.cancel();
        }
        else if(jQuery('md-menu-content').length > 0 ){
            //If md-menu is open it will close and then return
            $mdMenu.hide();
        }
        else if(jQuery('md-select-menu').length > 0 ){
            //If md-select is open it will close and then return
            $mdSelect.hide();
        }

        else{

            // If control :
            // side navigation,
            // bottom sheet,
            // popup dialog,
            // md-menu,
            // md-select
            // is not opening, It will show $mdDialog to ask for
            // Confirmation to close the application or go to the view of lasted state.

            // Check for the current state that not have previous state.
            // It will show $mdDialog to ask for Confirmation to close the application.

            if($ionicHistory.backView() == null){

                //Check is popup dialog is not open.
                if(jQuery('[id^=dialog]').length == 0 ) {

                    // mdDialog for show $mdDialog to ask for
                    // Confirmation to close the application.

                    $mdDialog.show({
                        controller: 'DialogController',
                        templateUrl: 'confirm-dialog.html',
                        targetEvent: null,
                        locals: {
                            displayOption: {
                                title: "Confirmation",
                                content: "Do you want to close the application?",
                                ok: "Confirm",
                                cancel: "Cancel"
                            }
                        }
                    }).then(function () {
                        //If user tap Confirm at the popup dialog.
                        //Application will close.
                        ionic.Platform.exitApp();
                    }, function () {
                        // For cancel button actions.
                    }); //End mdDialog
                }
            }
            else{
                //Go to the view of lasted state.
                $ionicHistory.goBack();
            }
        }

    },100);
    //End of $ionicPlatform.registerBackButtonAction

}); // End of menu toggle controller.