import {cookies} from 'next/headers';
import {authRequest,clearSession,sameOrigin,json,HttpError} from '../../../supabase';
export async function POST(req:Request){try{sameOrigin(req);const token=(await cookies()).get('ac-access')?.value;if(token)await authRequest('logout',{},token);await clearSession();return new Response(null,{status:303,headers:{Location:'/painel','Cache-Control':'no-store'}});}catch(e){return json({error:e instanceof HttpError?e.message:'Não foi possível sair. Tente novamente.'},e instanceof HttpError?e.status:503);}}
