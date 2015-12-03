#!/usr/bin/env python

import unittest
import subprocess
from irods.session import iRODSSession
from irods.models import Collection, User, DataObject

def coll_path(sess, user):
    return (sess.collections.get("/tempZone/home/"+user)).path

def new_coll(sess, user, collection):
    return (sess.collections.create("/tempZone/home/"+user+"/"+collection)).path

def new_data_object(sess, user, data_object):
    return (sess.data_objects.create("/tempZone/home/"+user+"/"+data_object)).path

def get_data_object_name(sess, user, data_object):
    new_data_object(sess, user, data_object)
    return (sess.data_objects.get("/tempZone/home/"+user+"/"+data_object)).name

def rw_to_file(sess, user, data_object, contents):
    obj = sess.data_objects.get(new_data_object(sess, user, data_object))
    with obj.open('r+') as test_file:
        test_file.write(contents)
        test_file.seek(0, 0)
        return test_file.readline()

def add_metadata(sess, user, data_object, metadata):

    #create new data object
    obj = sess.data_objects.get(new_data_object(sess, user, data_object))

    #add metadata to that object
    for key, value in metadata:
        obj.metadata.add(key, value)

    #retrieve metadata stored on that object
    full_return = [obj.metadata.get_one(key[0]) for key in metadata]

    #return only the values metadata
    return [str(section).split()[3] for section in full_return]

def gen_query(sess, user, collection, data_object):

    new_coll(sess, user, collection)

    new_data_object(sess, user, data_object)

    print(sess.query(
        DataObject.id,
        DataObject.name,
        DataObject.size,
        User.id,
        User.name,
        Collection.name
        ).all())

class Tests(unittest.TestCase):
    irods_user = 'irods'

    sess = iRODSSession(
        host='localhost',
        port=1247,
        user=irods_user,
        password='rods',
        zone='tempZone'
        )

    def test_coll_path(self):

        self.assertEqual(
            coll_path(
                Tests.sess,
                Tests.irods_user
            ),
            "/tempZone/home/"+Tests.irods_user
        )

    new_coll_name = "test_new_coll"

    def test_new_coll(self):

        self.assertEqual(
            new_coll(
                Tests.sess,
                Tests.irods_user,
                Tests.new_coll_name
            ),
            "/tempZone/home/"+Tests.irods_user+"/"+Tests.new_coll_name
        )

    new_object_name = "test_new_data_object"

    def test_new_data_object(self):

        self.assertEqual(
            new_data_object(
                Tests.sess,
                Tests.irods_user,
                Tests.new_object_name
            ),
            "/tempZone/home/"+Tests.irods_user+"/"+Tests.new_object_name
        )

    get_object_name = "test_get_data_object_name"

    def test_get_data_object_name(self):

        self.assertEqual(
            get_data_object_name(
                Tests.sess,
                Tests.irods_user,
                Tests.get_object_name
            ),
            Tests.get_object_name
        )

    rw_to_file = "test_rw_to_file"

    def test_rw_to_file(self):

        contents = "contents"
        self.assertEqual(
            rw_to_file(
                Tests.sess,
                Tests.irods_user,
                Tests.rw_to_file,
                contents
            ),
            contents
        )


    add_metadata_object = "test_add_metadata"

    def test_add_metadata(self):

        metadata = [('key1', 'value1'), ('key2', 'value2'), ('key3', 'value3')]
        self.assertEqual(
            add_metadata(
                Tests.sess,
                Tests.irods_user,
                Tests.add_metadata_object,
                metadata
            ),
            [value[1] for value in metadata]
        )


    @classmethod
    def tearDownClass(cls):
        Tests.sess.collections.remove("/tempZone/home/"+Tests.irods_user+"/"+Tests.new_coll_name)
        subprocess.call(['irm', Tests.new_object_name])
        subprocess.call(['irm', Tests.get_object_name])
        subprocess.call(['irm', Tests.rw_to_file])
        subprocess.call(['irm', Tests.add_metadata_object])

if __name__ == '__main__':
    unittest.main()
