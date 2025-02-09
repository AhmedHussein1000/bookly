import 'dart:developer';
import 'package:bookly/core/cache/hive_helper.dart';
import 'package:bookly/core/di/service_locator.dart';
import 'package:bookly/core/errors/exceptions.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/helpers/extensions.dart';
import 'package:bookly/core/network/api_constants.dart';
import 'package:bookly/core/network/api_services.dart';
import 'package:bookly/core/utils/app_constants.dart';
import 'package:bookly/features/books/data/models/book_model.dart';
import 'package:bookly/features/books/data/models/books_api_response_model.dart';
import 'package:bookly/features/books/domain/entities/book_entity.dart';
import 'package:bookly/features/books/domain/entities/books_api_response_entity.dart';
import 'package:bookly/features/books/domain/usecases/get_featured_books_usecase.dart';
import 'package:bookly/features/books/domain/usecases/get_newest_books_usecase.dart';
import 'package:bookly/features/books/domain/usecases/get_similar_books_usecase.dart';
import 'package:bookly/features/books/domain/usecases/search_books_usecase.dart';
import 'package:dio/dio.dart';

abstract class BaseBooksRemoteDataSource {
  Future<BooksApiResponseEntity> getFeaturedBooks(
      GetFeaturedBooksParams parameters);
  Future<BooksApiResponseEntity> getNewestBooks(
      GetNewestBooksParams parameters);
  Future<BooksApiResponseEntity> getSimilarBooks(
      GetSimilarBooksParams parameters);
  Future<List<BookEntity>> getSearchedBooks(SearchBooksParams parameters);
}

class BooksRemoteDataSourceImpl extends BaseBooksRemoteDataSource {
  final ApiService apiService;
  final hiveHelper = getIt.get<HiveHelper>();
  BooksRemoteDataSourceImpl(this.apiService);
  @override
  Future<BooksApiResponseEntity> getFeaturedBooks(
      GetFeaturedBooksParams parameters) async {
    try {
      Response response = await apiService.getData(
          endpoint: ApiConstants.featuredBooksEndpoint(
              pageNumber: parameters.pageNumber));
      if (response.statusCode == 200) {
        BooksApiResponseModel booksResponseModel =
            BooksApiResponseModel.fromJson(response.data);
            if(!booksResponseModel.books.isNullOrEmpty()){
await hiveHelper.saveBooks(
            books: booksResponseModel.books! ,
            boxKey: HiveHelper.featuredBox,
            category: 'featured',
            pageNumber: parameters.pageNumber,
            totalItems: booksResponseModel.totalItems,
           );
            }
        
        return booksResponseModel.toEntity();
      }
      throw const ServerException(AppConstants.unknownErrorMessage);
    } on DioException catch (e) {
      throw DioNetworkException(
          ServerFailure.fromDioException(dioException: e).errormsg);
    } catch (e) {
      log('error in getFeaturedBooks ${e.toString()}');
      throw const ServerException(AppConstants.unknownErrorMessage);
    }
  }

  @override
  Future<BooksApiResponseEntity> getNewestBooks(
      GetNewestBooksParams parameters) async {
    try {
      Response response = await apiService.getData(
          endpoint: ApiConstants.newestBooksEndpoint(
              pageNumber: parameters.pageNumber));
      if (response.statusCode == 200) {
        BooksApiResponseModel booksResponseModel =
            BooksApiResponseModel.fromJson(response.data);
            if(!booksResponseModel.books.isNullOrEmpty()){
        await hiveHelper.saveBooks(
          books: booksResponseModel.books! ,
          boxKey: HiveHelper.newestBox,
          category: 'newest',
          pageNumber: parameters.pageNumber,
          totalItems: booksResponseModel.totalItems,
         
        );      
            }
        
        return booksResponseModel.toEntity();
      }
      throw const ServerException(AppConstants.unknownErrorMessage);
    } on DioException catch (e) {
      throw DioNetworkException(
          ServerFailure.fromDioException(dioException: e).errormsg);
    } catch (e) {
      log('error in getNewestBooks ${e.toString()}');
      throw const ServerException(AppConstants.unknownErrorMessage);
    }
  }

  @override
  Future<BooksApiResponseEntity> getSimilarBooks(
      GetSimilarBooksParams parameters) async {
    try {
      Response response = await apiService.getData(
          endpoint: ApiConstants.similarBooksEndpoint(
              category: parameters.category,
              pageNumber: parameters.pageNumber));
      if (response.statusCode == 200) {
        BooksApiResponseModel booksResponseModel =
            BooksApiResponseModel.fromJson(response.data);
            if(!booksResponseModel.books.isNullOrEmpty()){
        await hiveHelper.saveBooks(
          books: booksResponseModel.books!,
          boxKey: HiveHelper.similarBox,
          category: parameters.category,
          pageNumber: parameters.pageNumber,
          totalItems: booksResponseModel.totalItems,
       
        );      
            }
        
        return booksResponseModel.toEntity();
      }
      throw const ServerException(AppConstants.unknownErrorMessage);
    } on DioException catch (e) {
      throw DioNetworkException(
          ServerFailure.fromDioException(dioException: e).errormsg);
    } catch (e) {
      log('error in getSimilarBooks ${e.toString()}');
      throw const ServerException(AppConstants.unknownErrorMessage);
    }
  }

  @override
  Future<List<BookEntity>> getSearchedBooks(
      SearchBooksParams parameters) async {
    try {
      Response response = await apiService.getData(
          endpoint: ApiConstants.searchedBooksEndpoint(
              categoryQuery: parameters.categoryQuery));
      if (response.statusCode == 200) {
        List<BookEntity> searchedBooks = getBooksFromJson(response: response);
        return searchedBooks;
      }
      throw const ServerException(AppConstants.unknownErrorMessage);
    } on DioException catch (e) {
      throw DioNetworkException(
          ServerFailure.fromDioException(dioException: e).errormsg);
    } catch (e) {
      log('error in searchBooks ${e.toString()}');
      throw const ServerException(AppConstants.unknownErrorMessage);
    }
  }

  List<BookEntity> getBooksFromJson({required Response response}) {
    if (response.data['items'] == null) {
      return [];
    }
    List<BookEntity> books = List<BookEntity>.from(response.data['items']
        .map((jsonBook) => BookModel.fromJson(jsonBook).toEntity()));
    return books;
  }
}
