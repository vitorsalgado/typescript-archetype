/* tslint:disable:global-require */
/* tslint:disable:no-var-requires */
/* tslint:disable:no-reference */

///<reference path="../../node_modules/@types/jest/index.d.ts"/>

import Config from './';

const Package = require('../../package.json');

describe('Config', () => {
	it('should correctly load configuration', () => {
		expect(Config.env).toEqual(process.env.NODE_ENV);
		expect(Config.isProduction).toBeFalsy();
		expect(Config.isTest).toBeTruthy();
		expect(Config.version).toEqual(Package.version);
	});
});
