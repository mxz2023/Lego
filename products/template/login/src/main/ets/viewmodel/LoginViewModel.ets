import { DataItem } from './DataItem';
import { CommonConstants } from '../constants/CommonConstants';

/**
 * Login view model, providing page display data.
 */
class LoginViewModel {
  /**
   * Get personal information of MainPage.
   *
   * @return {Array<DataItem>} personalListItems.
   */
  getPersonalListItems(): Array<DataItem> {
    let personalListItems: Array<DataItem> = [];
    for (let index = 1; index <= CommonConstants.LIST_SIZE; index++) {
      let personalListItem = new DataItem();
      personalListItem.title = $r('app.string.component_list_item_text', index);
      personalListItems.push(personalListItem);
    }
    return personalListItems;
  }

  /**
   * Get contact information of CustomerServicePage.
   *
   * @return {Array<DataItem>} contactListItems.
   */
  getContactListItems(): Array<DataItem> {
    let contactListItems: Array<DataItem> = [];
    let serviceHotline = new DataItem();
    serviceHotline.title = $r('app.string.service_hotline');
    serviceHotline.summary = $r('app.string.hotline_number');
    contactListItems.push(serviceHotline);
    let emailAddress = new DataItem();
    emailAddress.title = $r('app.string.email');
    emailAddress.summary = $r('app.string.email_address');
    contactListItems.push(emailAddress);
    return contactListItems;
  }
}

let loginViewModel = new LoginViewModel();

export default loginViewModel as LoginViewModel;