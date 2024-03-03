class Urls{
  static String baseUrl = 'http://sherpur.rbfgroupbd.com';
  static String getNotification(int size) => '$baseUrl/get_notification?page=1&pageSize=$size';
  static String updateNotification = '$baseUrl/update_notification_status';

  static String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNzA5NDczOTI3LCJleHAiOjE3MDk1NjAzMjd9.VXBCSlvoN4MUz8Tkkw7pLZU7DHD9OgMNnFxmtEKe5Hk';
}