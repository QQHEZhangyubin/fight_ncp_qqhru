import '../../data/contact_data.dart';
import '../../injection/dependency_injection.dart';

abstract class ContactListViewContract{
  void onLoadContactsComplete(List<Contact> items);

  void onLoadContactsError();
}

class ContactListPresenter{
  ContactListViewContract _view;
  ContactRepository _repository;

  ContactListPresenter(ContactListViewContract _contactListState){
    _view = _contactListState;
    _repository = Injector().contactRepository;
  }
//  ContactListPresenter(this._view){
//    _repository = Injector().contactRepository;
//  }
//  ContactListPresenter(this._view){
//    _repository = Injector().contactRepository;
//  }
  void loadContacts(){
    assert(_view != null);

    _repository
    .fetch()
    .then((contacts) => _view.onLoadContactsComplete(contacts))
    .catchError((onError) => _view.onLoadContactsError());
  }
}