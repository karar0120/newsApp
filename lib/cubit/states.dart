abstract class newsappState{}

class initialState extends newsappState{}


class changebottonnavigationbar extends newsappState{}

class NewsGetbusinesloadingstatue extends newsappState{}

class NewsGetbusinesSuccessstatue extends newsappState{}

class NewsGetbusinesErrorstatue extends newsappState{

  final String Error;
  NewsGetbusinesErrorstatue(this.Error);
}

class NewsGetSportsloadingstatue extends newsappState{}

class NewsGetSportsSuccessstatue extends newsappState{}

class NewsGetSportsErrorstatue extends newsappState{

  final String Error;
  NewsGetSportsErrorstatue(this.Error);
}


class NewsGetScienceloadingstatue extends newsappState{}

class NewsGetScienceSuccessstatue extends newsappState{}

class NewsGetScienceErrorstatue extends newsappState{

  final String Error;
  NewsGetScienceErrorstatue(this.Error);
}
class NewsChangemoda extends newsappState{}



class NewsGetSearchloadingstatue extends newsappState{}

class NewsGetSearchSuccessstatue extends newsappState{}

class NewsGetSearchErrorstatue extends newsappState{

  final String Error;
  NewsGetSearchErrorstatue(this.Error);
}


