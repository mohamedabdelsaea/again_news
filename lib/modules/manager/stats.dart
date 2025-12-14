
part of 'cubit.dart';

abstract class HomeStats {
  HomeStats();
}

class InitialHomeStat extends HomeStats {
  InitialHomeStat();
}

class SetSelectedCategoryStat extends HomeStats {
  SetSelectedCategoryStat();
}

class LoadingGetAllSourcesStat extends HomeStats {}
class SuccessGetAllSourcesStat extends HomeStats {}
class ErrorGetAllSourcesStat extends HomeStats {}

class LoadingGetAllArticlesStat extends HomeStats {}
class SuccessGetAllArticlesStat extends HomeStats {}
class ErrorGetAllArticlesStat extends HomeStats {}
