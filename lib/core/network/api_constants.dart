abstract class ApiConstants {
  static const String baseUrl = 'https://www.googleapis.com/books/v1/';
  static const int pageSize = 20;
  static String featuredBooksEndpoint({int pageNumber = 0}) =>
      'volumes?Filtering=free-ebooks&startIndex=${pageNumber * pageSize}&maxResults=$pageSize&q=subject:comedy';
  static String newestBooksEndpoint({int pageNumber = 0}) =>
      'volumes?Filtering=free-ebooks&q=subject:science&startIndex=${pageNumber * pageSize}&maxResults=$pageSize&Sorting=newest';
  static String similarBooksEndpoint(
          {required String category, int pageNumber = 0}) =>
      'volumes?sorting=relevance&Filtering=free-ebooks&startIndex=${pageNumber * pageSize}&maxResults=$pageSize&q=subject:$category';
  static String searchedBooksEndpoint({required String categoryQuery}) =>
      'volumes?Filtering=free-ebooks&q=subject:$categoryQuery';
}
