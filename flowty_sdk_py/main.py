# *-* coding: utf-8 *-*
from datetime import datetime

import models.workflow_pb2 as openworkflow


def to_file(workflow):
    with open("./serializedFile", "wb") as fd:
        fd.write(workflow.SerializeToString())


if __name__ == "__main__":
    w = openworkflow.Workflow()
    w.workflow_id = "abc"
    w.schedule = "* * * * *"
    w.start_time = datetime(2020, 6, 20).isoformat()

    print(w)
    to_file(w)
