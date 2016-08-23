import { getTimes } from './timing';

export default class Buzzfeed {
  constructor(clientKey) {
    this._clientKey = clientKey;
    this._baseURI = 'http://localhost:4000/api/';

    this._trackLoadTime = this._trackLoadTime.bind(this);
  }

  init() {
    window.addEventListener('load', this._trackLoadTime);
  }

  _trackLoadTime() {
    console.log('Client Key:', this._key);
    console.log('Tracking load times', getTimes());

    this._trackResourceTiming();
  }

  _trackResourceTiming() {
    const acceptedInitiatorTypes = [
      'link',
      'script',
      'css',
    ];

    const entries = window.performance.getEntries()
      .filter((entry) => {
        return acceptedInitiatorTypes.indexOf(entry.initiatorType) !== -1;
      });

    console.log(entries);
  }

  track(event, info) {
    console.log('Tracking for event:', event);
    console.log('Payload:', info);
  }
}
