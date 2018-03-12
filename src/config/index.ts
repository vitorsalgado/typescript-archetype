/* tslint:disable:no-var-requires */

import * as Joi from 'joi';
import EnvSchema from './env.schema';

const Package = require('../../package.json');
const EnvVars = Joi.attempt(process.env, EnvSchema);

export default {
	env: EnvVars.NODE_ENV,
	version: Package.version,

	isProduction: EnvVars.NODE_ENV === 'production',
	isTest: EnvVars.NODE_ENV === 'test'
};
