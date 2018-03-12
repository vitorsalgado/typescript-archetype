import * as Joi from 'joi';

/**
 * Environment variables schema
 * @enum
 * @readonly
 */
export default Joi.object(
	{
		/**
		 * Application runtime environment
		 * @const NODE_ENV
		 * @type {String}
		 * @default develop
		 */
		NODE_ENV: Joi.string().allow('develop', 'test', 'production').default('develop')
	})
	.unknown(true)
	.options({ abortEarly: false });
