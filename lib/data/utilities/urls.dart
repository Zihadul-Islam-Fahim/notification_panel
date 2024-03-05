class Urls{
  static String baseUrl = 'http://sherpur.rbfgroupbd.com';
  static String getNotification(int size) => '$baseUrl/get_notification?page=1&pageSize=$size';
  static String updateNotification = '$baseUrl/update_notification_status';

  static String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNzA5NjU3NTYzLCJleHAiOjE3MDk3NDM5NjN9.pipj9aEYdtfYas8CEuAgMR0YRoBJxtrAHISEwXBkLC8';
}